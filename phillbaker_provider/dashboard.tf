
locals {
  response_time_vis_state = jsonencode({
    "title": "Response Time",
    "type": "line",
    "aggs": [
        {
            "id": "1",
            "enabled": true,
            "type": "avg",
            "params": {
                "field": "durationInNanos",
                "customLabel": "Response Time (ns)"
            },
            "schema": "metric"
        },
        {
            "id": "2",
            "enabled": true,
            "type": "date_histogram",
            "params": {
                "field": "startTime",
                "timeRange": {
                    "from": "now-15m",
                    "to": "now"
                },
                "useNormalizedOpenSearchInterval": true,
                "scaleMetricValues": false,
                "interval": "auto",
                "drop_partials": false,
                "min_doc_count": 1,
                "extended_bounds": {}
            },
            "schema": "segment"
        },
        {
            "id": "4",
            "enabled": true,
            "type": "terms",
            "params": {
                "field": "name",
                "orderBy": "_key",
                "order": "desc",
                "size": 5,
                "otherBucket": false,
                "otherBucketLabel": "Other",
                "missingBucket": false,
                "missingBucketLabel": "Missing"
            },
            "schema": "group"
        },
        {
            "id": "5",
            "enabled": true,
            "type": "terms",
            "params": {
                "field": "span.attributes.http@status_code",
                "orderBy": "1",
                "order": "desc",
                "size": 5,
                "otherBucket": false,
                "otherBucketLabel": "Other",
                "missingBucket": false,
                "missingBucketLabel": "Missing"
            },
            "schema": "group"
        }
    ],
    "params": {
        "type": "line",
        "grid": {
            "categoryLines": false
        },
        "categoryAxes": [
            {
                "id": "CategoryAxis-1",
                "type": "category",
                "position": "bottom",
                "show": true,
                "style": {},
                "scale": {
                    "type": "linear"
                },
                "labels": {
                    "show": true,
                    "filter": true,
                    "truncate": 100
                },
                "title": {}
            }
        ],
        "valueAxes": [
            {
                "id": "ValueAxis-1",
                "name": "LeftAxis-1",
                "type": "value",
                "position": "left",
                "show": true,
                "style": {},
                "scale": {
                    "type": "linear",
                    "mode": "normal"
                },
                "labels": {
                    "show": true,
                    "rotate": 0,
                    "filter": false,
                    "truncate": 100
                },
                "title": {
                    "text": "Response Time (ns)"
                }
            }
        ],
        "seriesParams": [
            {
                "show": true,
                "type": "line",
                "mode": "normal",
                "data": {
                    "label": "Response Time (ns)",
                    "id": "1"
                },
                "valueAxis": "ValueAxis-1",
                "drawLinesBetweenPoints": true,
                "lineWidth": 2,
                "interpolate": "linear",
                "showCircles": true
            }
        ],
        "addTooltip": true,
        "addLegend": true,
        "legendPosition": "right",
        "times": [],
        "addTimeMarker": false,
        "labels": {},
        "thresholdLine": {
            "show": false,
            "value": 10,
            "width": 1,
            "style": "full",
            "color": "#E7664C"
        }
    }
})
}


resource "elasticsearch_kibana_object" "test_visualization_v7" {
  body = <<EOF
[
  {
    "_id": "response-time",
    "_source": {
      "type": "visualization",
      "visualization": {
        "title": "Total response",
        "visState": ${jsonencode(local.response_time_vis_state)},
        "uiStateJSON": "{}",
        "description": "",
        "version": 1
      }
    }
  }
]
EOF
}

output "debug" {
    value = <<EOF
[
  {
    "_id": "response-time",
    "_source": {
      "type": "visualization",
      "visualization": {
        "title": "Total response",
        "visState": ${jsonencode(local.response_time_vis_state)},
        "uiStateJSON": "{}",
        "description": "",
        "version": 1
      }
    }
  }
]
EOF
}
