#!/bin/bash

validatorversion=5.6.86
validatorversion_underscore=${validatorversion//./_}
validatordestination=~/.fhir/validators/validator_cli_v$validatorversion_underscore.jar
outputfolder=./compare_results
proxy_active=true
proxy_address="192.168.110.10:3128"

function validate_url() {
    if [[ $(wget -S --spider $1 2>&1 | grep 'HTTP/1.1 200 OK') ]]; then
        return 0
    else
        return 1
    fi
}

checkOrCreateConfigFile() {
    configurationfile="scripts/validation_script-config.yaml"
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

runcomparison() {
    mkdir -p "$outputfolder"

    # Concatenate folders_for_validation in fhir directory
    folders_to_validate=""
    #   for package in $( (ls -d $fhir_folder_path/*/package)); do
    #       folders_to_validate+=" -ig ${package}"
    #  done
    folders_to_validate+=" -ig /home/dev/.fhir/packages/kbv.ita.erp#1.0.2/package/"
    folders_to_validate+=" -ig /home/dev/.fhir/packages/kbv.ita.erp#1.1.0/package/"
    # Proxy Settings
    proxy_string=""
    if [ $proxy_active == "true" ]; then
        proxy_string="-proxy $proxy_address"
    fi
    java -jar $validatordestination -compare $proxy_string -dest $outputfolder \
        -version 4.0.1 $folders_to_validate \
        -left "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle|1.0.2" \
        -right "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle|1.1.0"
    #  -left /home/dev/.fhir/packages/kbv.ita.erp#1.0.2/package/KBV_PR_ERP_Bundle.json \
    #  -right /home/dev/.fhir/packages/kbv.ita.erp#1.1.0/package/KBV_PR_ERP_Bundle.json

}

checkOrCreateConfigFile
checkAndDownloadHapiValidator
runcomparison
