# Variables for Sub Compartment Creation based on an exising Master Compartment
variable "compartment_name" {}
variable "compartment_description" {}
variable "compartment_master_ocid" {}
variable "tenancy_ocid" {}

# Variables for Compute Instances Application Server and OpenVPN Access Server
variable "compute_shape" {}
variable "compute_source_id" {}
variable "compute_display_name-01" {}
variable "openvpnas_display_name" {}
variable "compute_ssh_authorized_keys" {}

# Variables for Virtual Cloud Network VCN Cration - private and public Subnets
variable "vcn_region" {}
variable "vcn_vcn_name" {}
variable "vcn_vcn_dns_label" {}
variable "vcn_cidr" {}
variable "vcn_private_cidr_block" {}
variable "vcn_public_cidr_block" {}
variable "nat_gateway_display_name" {}
variable "internet_gateway_display_name" {}
variable "service_gateway_enabled" {}
variable "service_gateway_display_name" {}
variable "private_route_table_display_name" {}
variable "public_route_table_display_name" {}

# Variables for OpenVPN
variable "mp_listing_id" {}
variable "mp_listing_resource_id" {}
variable "mp_listing_resource_version" {}
variable "openvpn_admin_password" {}
variable "openvpn_admin_username" {}
variable "openvpn_activation_key" {}