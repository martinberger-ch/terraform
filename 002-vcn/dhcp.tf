resource "oci_core_dhcp_options" "dhcp-options"{

  # Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaax3li46zbz4ffc3xuuea3u5t3rq5haezki5hnaj4msb32legznpaq"
  vcn_id = module.vcn.vcn_id
  #Options for type are either "DomainNameServer" or "SearchDomain"
  options {
      type = "DomainNameServer"  
      server_type = "VcnLocalPlusInternet"
  }
  
  # Optional
  display_name = "default-dhcp-options"
}