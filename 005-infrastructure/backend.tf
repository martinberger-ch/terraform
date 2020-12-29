terraform {
  backend "http" {
    update_method = "PUT"
    address       = "https://objectstorage.eu-zurich-1.oraclecloud.com/p/ws6ZtO1hV76WEhdxY0i0b5IMMWRE41FniPsobvYqqV7QGP3-hGjuxuqvo3t20B3Y/n/zrq07gukammy/b/terraform_state_file/oterraform.tfstate"
  }
}