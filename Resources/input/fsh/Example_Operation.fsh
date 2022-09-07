Profile: ExampleOperation
Parent: Parameters
Id: SubmitDocumentOutput
Title: "ExampleOperation"
Description: "Profil zur Validierung der Output-Parameter für $submit-document"
* insert Meta
* parameter 1..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains output-metadata 1..1 MS and information 0..1  
* parameter[output-metadata]
  * ^short = "Dokumentenmetadaten wie sie vom Server verstanden/persistiert wurden"
  * ^comment = "..."
  * name MS 
    * ^short = "Name des Parameters"
    * ^comment = "=output-metadata"
  * name = "output-metadata" (exactly)
  * resource 1..1 MS
  * resource only ISiKPatient
    * ^short = "Ressource vom Type `DocumentReference`"
  * resource
    * id 1..1 MS
      * ^short = "Serverseitig zugewiesene Datensatz-ID"
      * ^comment = "Der Server mus dem Datensatz eine eindeutige ID zuweisen und diese zurückgeben."
    * type.coding[XDS] 1..1 MS 
      * ^comment = "Der Server muss fehlende XDS-Type-Codes anhand des übermittelten KDL-Codes ergänzen."
    * category.coding[XDS] 1..1 MS
      * ^comment = "Der Server muss fehlende XDS-Class-Codes anhand des übermittelten KDL-Codes ergänzen."
* parameter[information]
  * ^short = "Informationen/Hinweise zum Ergebnis der Operation"
  * ^comment = "..."
  * name MS 
    * ^short = "Name des Parameters"
    * ^comment = "=information"
  * name = "information" (exactly)
  * resource 1..1 MS 
  * resource only OperationOutcome
    * ^short = "Ressource vom Type `OperationOutcome`"

Instance: ExampleOutput-params
InstanceOf: ExampleOperation
Usage: #example
Title: "ExampleOutput-params"
Description: ""
* parameter[+]
  * name = "output-metadata"
  * resource = dok-beispiel-server
    * id = "123456789"
    * content.attachment.url = "http://mein-dokumentenserver/dokumente/1231232312.pdf"
* parameter[+]
  * name = "information"
  * resource = oo-beispiel

Instance: oo-beispiel
InstanceOf: OperationOutcome
Usage: #example
Title: "oo-beispiel"
* issue
  * severity = #information
  * code = #informational
  * diagnostics = "Well done!"