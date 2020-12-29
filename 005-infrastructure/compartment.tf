resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = var.compartment_master_ocid
    description = var.compartment_description
    name = var.compartment_name
}