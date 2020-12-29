resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.compartment.oc1..aaaaaaaat5uo2xh77edws4huwvqorengp7x4xdv6x3giw3vryk36vyydwsdq"
    description = "Compartment for Terraform resources."
    name = "Terraform_2"
}