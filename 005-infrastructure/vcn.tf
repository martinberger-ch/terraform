module "vcn"{
  source  = "oracle-terraform-modules/vcn/oci"
  version = "1.0.3"
  # Use the latest version, if there is one newer than "1.0.3"
  # insert the 4 required variables here

  # Required
  compartment_id = oci_identity_compartment.tf-compartment.id
  region = var.vcn_region
  vcn_name = var.vcn_vcn_name
  vcn_dns_label = var.vcn_vcn_dns_label

  # Optional
  vcn_cidr = var.vcn_cidr
}