# VARS for Compute

variable "compute_shape" {
        default= "VM.Standard.E2.1"
}

variable "compute_source_id" {
        default="ocid1.image.oc1.eu-zurich-1.aaaaaaaaxuq5fxk44frdwth73qxxdyfbmfzmqauyoo5d6ortrwhgfp5lme2q"
}

variable "compute_display_name-01" {
        default="Compute Instance Public"
}

variable "compute_display_name-02" {
        default="Compute Instance Private"
}

variable "compute_ssh_authorized_keys" {
        default="../998-ssh/terraform_deployments_29122020.pub"
}

# VARS for Compartment

variable "compartment_name" {
     default="Terraform01"
}

variable "compartment_description" {
     default="Terraform Compartment 01"
}

variable "compartment_master_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaat5uo2xh77edws4huwvqorengp7x4xdv6x3giw3vryk36vyydwsdq"
}


variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaaxuk4je4t3aorovuzmwyeaq5sftqv3nkyz64snijtdkitadbqqxmq"
}

# ocid1.compartment.oc1..aaaaaaaat5uo2xh77edws4huwvqorengp7x4xdv6x3giw3vryk36vyydwsdq = Compartment Mohnweg


# VARS for VCN
variable "vcn_region" {
    default = "eu-zurich-1"
}

variable "vcn_vcn_name" {
    default = "vcn-terraform-01"
}

variable "vcn_vcn_dns_label" {
    default = "vcnterraform01"
}


variable "vcn_cidr" {
    default = "10.1.0.0/24"
}

variable "private_cidr_block" {
    default = "10.1.0.32/27"
}

variable "public_cidr_block" {
    default = "10.1.0.0/27"
}

variable "nat_gateway_display_name" {
    default = "ng-01"
}

variable "internet_gateway_display_name" {
    default = "ig-01"
}

variable "private_route_table_display_name" {
    default = "rt-private-01"
}

variable "public_route_table_display_name" {
    default = "rt-public-01"
}

