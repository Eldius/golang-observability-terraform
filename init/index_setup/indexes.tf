
resource "opensearch_index" "logs" {
  depends_on = [
    opensearch_ism_policy.logs_cleanup
  ]

  name               = "application-logs-0001"
  number_of_shards   = 1
  number_of_replicas = 1
  #rollover_alias = "application-logs"
  aliases = jsonencode({"application-logs":{}})
#  mappings           = <<EOF
#{
#  "people": {
#    "_all": {
#      "enabled": false
#    },
#    "properties": {
#      "email": {
#        "type": "text"
#      }
#    }
#  }
#}
#EOF
}

resource "opensearch_index" "metrics" {
  depends_on = [
    opensearch_ism_policy.metrics_cleanup
  ]

  name               = "metrics-otel-v1-0001"
  number_of_shards   = 1
  number_of_replicas = 1
  #rollover_alias = "metrics-otel-v1"
  aliases = jsonencode({"metrics-otel-v1":{}})
#  mappings           = <<EOF
#{
#  "people": {
#    "_all": {
#      "enabled": false
#    },
#    "properties": {
#      "email": {
#        "type": "text"
#      }
#    }
#  }
#}
#EOF
}


