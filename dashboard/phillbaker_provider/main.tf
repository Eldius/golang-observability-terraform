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
  kibana_url  = "http://192.168.100.195:5601"
  username    = "admin"
  password    = "admin"
  healthcheck = false
  insecure    = true
  elasticsearch_version = "2.0"
}
