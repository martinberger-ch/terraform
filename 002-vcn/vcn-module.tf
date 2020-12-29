module "vcn"{
  source  = "oracle-terraform-modules/vcn/oci"
  version = "1.0.3"
  # Use the latest version, if there is one newer than "1.0.3"
  # insert the 4 required variables here

  # Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaax3li46zbz4ffc3xuuea3u5t3rq5haezki5hnaj4msb32legznpaq"
  region = "eu-zurich-1"
  vcn_name = "vcn-tf-1"
  vcn_dns_label = "vcntf1"

  # Optional
  internet_gateway_enabled = true
  nat_gateway_enabled = true
  service_gateway_enabled = true
  vcn_cidr = "10.0.0.0/16"
}