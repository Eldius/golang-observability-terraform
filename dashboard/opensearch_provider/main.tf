terraform {
  required_providers {
    opensearch = {
      source = "opensearch-project/opensearch"
      version = "~>1.0"
    }
  }
}

provider "opensearch" {
  url = "https://192.168.100.195:9200"
  username = "admin"
  password = "admin"
  healthcheck = false
  insecure = true
  opensearch_version = 2.0
}
