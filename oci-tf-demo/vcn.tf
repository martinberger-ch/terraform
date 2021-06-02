module "vcn"{
  source  = "oracle-terraform-modules/vcn/oci"
  version = "1.0.3"
  # Use the latest version, if there is one newer than "1.0.3"
  # insert the 4 required variables here

  # Required
  compartment_id = var.compartment_id
  region = var.region
  vcn_name = var.vcn_name
  vcn_dns_label = var.vcn_dns_label

  # Optional
  internet_gateway_enabled = true
  nat_gateway_enabled = true
  service_gateway_enabled = true

}
