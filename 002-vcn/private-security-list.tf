resource "oci_core_security_list" "private-security-list"{

# Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaax3li46zbz4ffc3xuuea3u5t3rq5haezki5hnaj4msb32legznpaq"
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-private-subnet"

  egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all" 
  }
}