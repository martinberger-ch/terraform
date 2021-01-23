data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
  count = var.service_gateway_enabled == true ? 1 : 0
}

resource "oci_core_service_gateway" "service_gateway" {
    compartment_id = oci_identity_compartment.tf-compartment.id
  display_name   = var.service_gateway_display_name

  services {
    service_id = lookup(data.oci_core_services.all_oci_services[0].services[0], "id")
  }

  vcn_id = module.vcn.vcn_id
  # route_table_id = oci_core_route_table.private_route_table.id

  count = var.service_gateway_enabled == true ? 1 : 0
}