#!/bin/bash
GREEN='\033[0;32m'
LGREEN'\033[1;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color
# ./compare.sh -g kbv.ita.erp:1.0.2,kbv.ita.erp:1.1.0 -l "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle|1.0.2" -r "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle|1.1.0"
# validatorversion=5.6.48
validatorversion=5.6.89-SNAPSHOT-at2
validatorversion_underscore=${validatorversion//./_}
validatordestination=~/.fhir/validators/validator_cli_v$validatorversion_underscore.jar
outputfolder=./compare_results
proxy_active=true
proxy_address="192.168.110.10:3128"
packages_string=""
left_file=""
right_file=""
install_dependencies="false"

function validate_url() {
    if [[ $(wget -S --spider $1 2>&1 | grep 'HTTP/1.1 200 OK') ]]; then
        return 0
    else
        return 1
    fi
}

checkOrCreateConfigFile() {
    configurationfile="scripts/script-config.yaml"
    if test -e $configurationfile; then
        echo "[INFO] Configurationfile '$configurationfile' found."
        readarray proxySettings < <(yq e '.proxy' $configurationfile)
        IFS=: read -r a active <<<"${proxySettings[0]}"
        if [ $active == "true" ]; then
            IFS=: read -r b proxy_address_new <<<"${proxySettings[1]}"
            proxy_address_new=${proxy_address_new//[[:blank:]]/}
            if [ "$proxy_address" != "$proxy_address_new" ]; then
                proxy_address=$proxy_address_new
                echo "[INFO] Updated proxy address to $proxy_address"
            fi
        else
            echo "[INFO] Deactivated proxy usage."
            proxy_active=false
        fi

    else
        echo "proxy:" >>$configurationfile
        echo "  active: true" >>$configurationfile
        echo "  address: 192.168.110.10:3128" >>$configurationfile
        echo "[INFO] Written new '$configurationfile'. Please change proxy settings if needed."
    fi
}

checkAndDownloadHapiValidator() {
    validatorversion_underscore=${validatorversion//./_}
    validatordestination=~/.fhir/validators/validator_cli_v$validatorversion_underscore.jar
    echo "[INFO] Looking for HAPI Validator at $validatordestination"
    if test -e "$validatordestination"; then
        echo "[INFO] HAPI Validator found at '$validatordestination'"
    else
        validatorsource=https://github.com/hapifhir/org.hl7.fhir.core/releases/download/$validatorversion/validator_cli.jar
        echo "[INFO] HAPI Validator not found. Starting to download HAPI Validator from $validatorsource ..."
        parentdir="$(dirname "$validatordestination")"
        mkdir -p "$parentdir"
        if validate_url $validatorsource; then
            wget $validatorsource -O $validatordestination
        else
            echo -e "${RED}[ERROR] Unable to Download Hapi Validator in version $validatorversion. Script will end here. ${NC}"
            exit 0
        fi
    fi
}

installDependencies() {
    if [ $install_dependencies == "true" ]; then
        echo -e "${GREEN}[INFO] Installing depencencies...${NC}"
        IFS=, read -ra package_string <<<"$packages_string"
        mkdir -p dependencies
        for p in "${package_string[@]}"; do
            IFS=: read -r package version <<<"$p"
            if [[ ${package:0:1} != "#" ]]; then
                echo "[INFO] Installing $package with version $version"
                fhir install "$package" "$version" --here
                echo "[INFO] Moving package $package#$version"
                mv "$package#$version" depencencies/"$package#$version"

            fi
        done
    fi
}

runcomparison() {
    if [ -z "$packages_string" ]; then
        echo "${RED}[ERROR] no packages received. Start script with '-g packages_string'${NC}"
        exit 0
    fi
    IFS=, read -ra packages <<<"$packages_string"
    for p in "${packages[@]}"; do
        IFS=: read -r package version <<<"$p"
        package_for_comparison+=" -ig ./dependencies/${package}#${version}/package"
        outputfolder+="_${package}_${version}"
    done
    mkdir -p "$outputfolder"
    proxy_string=""
    if [ $proxy_active == "true" ]; then
        proxy_string="-proxy $proxy_address"
    fi
    command="java -jar "$validatordestination" -compare "$proxy_string" -dest $outputfolder \
        -version 4.0.1 $package_for_comparison \
        -left "$left_file" \
        -right "$right_file""
    echo "$command"
}

print_usage() {
    printf "Usage:
  [-g packages_string] - parameter that specifies the packages to load, that contain the profiles you want to compare. Example: '-g kbv.ita.erp#1.0.2 kbv.ita.erp#1.1.0'
  [-l profile] left profile to compare.
  [-r profile] left file to compare.
  [-i] installs dependencies with firely.terminal received with the -d option
  [-v version] specifies the version of the used Hapi Validator to use. Example: -v 5.6.48\n"
}

while getopts 'g:l:r:v:i' flag; do
    case "${flag}" in
    g) packages_string="${OPTARG}" ;;
    l) left_file="${OPTARG}" ;;
    r) right_file="${OPTARG}" ;;
    i) install_dependencies="true" ;;
    v) validatorversion="${OPTARG}" ;;
    ?)
        print_usage
        exit 1
        ;;
    esac
done

clear
installDependencies
checkOrCreateConfigFile
checkAndDownloadHapiValidator
runcomparison
