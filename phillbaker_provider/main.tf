terraform {
  required_providers {
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "~>2.0"
    }
  }
}

provider "elasticsearch" {
  # Configuration options
  url         = "https://192.168.100.195:9200"
  username    = "terraform"
  password    = "admin"
  healthcheck = false
  insecure    = true
}
