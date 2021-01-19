terraform {
  backend "http" {
    update_method = "PUT"
    address       = "https://objectstorage.eu-zurich-1.oraclecloud.com/p/bEfUlAV0bDEfyoWstXlcYtDemHHV5pl1nEgQUUH7AA6uCEcGcqzIFefbHrOSTm9o/n/zrq07gukammy/b/terraform_state_file/o/terraform.tfstate"
  }
}