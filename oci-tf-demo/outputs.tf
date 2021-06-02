output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

output "demo_public_ip" {
  value = oci_core_public_ip.demo_public_ip.ip_address
}