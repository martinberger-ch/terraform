output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

output "public-ip-for-compute-instance" {
  value = oci_core_instance.compute_instance.public_ip
} 

output "instance-name" {
  value = oci_core_instance.compute_instance.display_name
} 

output "instance-state" {
  value = oci_core_instance.compute_instance.state
} 