# VARS for Compute

variable "compute_shape" {
        default= "VM.Standard.E2.1"
}

variable "compute_source_id" {
        default="ocid1.image.oc1.eu-zurich-1.aaaaaaaaxuq5fxk44frdwth73qxxdyfbmfzmqauyoo5d6ortrwhgfp5lme2q"
}

variable "compute_display_name" {
        default="My Terraform Compute Instance"
}

variable "compute_ssh_authorized_keys" {
        default="/home/oci/.oci/terraform_deployments_29122020.pub"
}

# VARS for Compartment

variable "compartment_name" {
     default="Terraform3"
}

variable "compartment_description" {
     default="Terraform 3 Compartment"
}

variable "compartment_master_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaat5uo2xh77edws4huwvqorengp7x4xdv6x3giw3vryk36vyydwsdq"
}
# ocid1.compartment.oc1..aaaaaaaat5uo2xh77edws4huwvqorengp7x4xdv6x3giw3vryk36vyydwsdq = Compartment Mohnweg


# VARS for VCN
variable "vcn_region" {
    default = "eu-zurich-1"
}

variable "vcn_vcn_name" {
    default = "vcn-tf-3"
}

variable "vcn_vcn_dns_label" {
    default = "vcntf3"
}