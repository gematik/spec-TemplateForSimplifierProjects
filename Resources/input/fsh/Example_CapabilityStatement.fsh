Instance: ExampleCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* insert Meta-Inst
* url = "https://gematik.de/fhir/isik/v2/Dokumentenaustausch/CapabilityStatement/dokumentenaustausch-server"
* name = "ISiKCapabilityStatementDokumentenaustauschServer"
* title = "ISiK CapabilityStatement Dokumentenaustausch Server"
* description = "Das vorliegende CapabilityStatement beschreibt alle verpflichtenden Interaktionen die ein ISiK-konformes System unterstützen muss um das Bestätigungsverfahren des Moduls &quot;Dokumentenaustausch&quot; zu bestehen."
* jurisdiction = urn:iso:std:iso:3166#DE "Germany"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* implementationGuide = "https://gematik.de/fhir/ISiK/ImplementationGuide/ISiK-Dokumentenaustausch|2.0.0"
* rest.mode = #server
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Patient
  * supportedProfile = "https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKPatient"
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "identifier"
    * definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "family"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "given"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "birthdate"
    * definition = "hhttp://hl7.org/fhir/SearchParameter/individual-birthdate"
    * type = #date
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "gender"
    * definition = "hhttp://hl7.org/fhir/SearchParameter/individual-gender"
    * type = #token
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Encounter
  * supportedProfile = "https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKKontaktGesundheitseinrichtung"
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "identifier"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-identifier"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "status"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-status"
    * type = #token  
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "class"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-class"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
    * type = #reference
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "subject"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-subject"
    * type = #reference
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "part-of"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-part-of"
    * type = #reference
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "date"
    * definition = "http://hl7.org/fhir/SearchParameter/Encounter-date"
    * type = #date
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #DocumentReference
  * supportedProfile = "https://gematik.de/fhir/isik/v2/Dokumentenaustausch/StructureDefinition/ISiKDokumentenMetadaten"
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * code = #search-type
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "status"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-status"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "patient"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-patient"
    * type = #reference
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-type"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "category"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-category"
    * type = #token
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "creation"
    * definition = "http://profiles.ihe.net/ITI/MHD/SearchParameter/DocumentReference-Creation"
    * type = #date
  * searchParam[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #SHALL
    * name = "encounter"
    * definition = "http://hl7.org/fhir/SearchParameter/DocumentReference-encounter"
    * type = #reference
* rest.resource[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * type = #Binary
  * supportedProfile = "https://gematik.de/fhir/isik/v2/Basismodul/StructureDefinition/ISiKBinary"
  * interaction[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #MAY
    * code = #read   
* rest.operation[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #SHALL
  * name = #submit-document
  * definition = Canonical(SubmitDocument)
* rest.operation[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #MAY
  * name = #update-metadata
  * definition = Canonical(UpdateMetadata)
* rest.operation[+]
  * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * extension.valueCode = #MAY
  * name = #generate-metadata
  * definition = Canonical(GenerateMetadata)
