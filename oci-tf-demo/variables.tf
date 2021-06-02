# provider identity parameters ----------------------------------------------
variable "user_ocid" {
  description = "user OCID used to access OCI"
  type        = string
}
variable "fingerprint" {
  description = "Fingerprint for user"
  type        = string
}

variable "private_key_path" {
  description = "Private Key Path"
  type        = string
}

variable "tenancy_ocid" {
  description = "tenancy id where to create the resources"
  type        = string
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The OCI region where resources will be created"
  type        = string
}


# vcn parameters ----------------------------------------------------
variable "vcn_name" {
  description = "Name of the VCN"
  type        = string
}

variable "vcn_dns_label" {
  description = "DNS Label of the VCN"
  type        = string
}

variable "vcn_cidr" {
  description = "VCN CIDR Range"
  type        = string
}


# general oci parameters ----------------------------------------------------
variable "compartment_id" {
  description = "OCID of the compartment"
  type        = string
}


