
resource "opensearch_dashboard_object" "logs_index_pattern" {
  body = <<EOF
[
  {
    "_id": "index-pattern:application-logs-*",
    "_type": "doc",
    "_source": {
      "type": "index-pattern",
      "index-pattern": {
        "title": "application-logs-*",
        "timeFieldName": "time"
      }
    }
  }
]
EOF
}

resource "opensearch_dashboard_object" "metrics_index_pattern" {
  body = <<EOF
[
  {
    "_id": "index-pattern:metrics-otel-v1-*",
    "_type": "doc",
    "_source": {
      "type": "index-pattern",
      "index-pattern": {
        "title": "metrics-otel-v1-*",
        "timeFieldName": "time"
      }
    }
  }
]
EOF
}
