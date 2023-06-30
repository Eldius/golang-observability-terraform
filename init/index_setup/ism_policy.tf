
resource "opensearch_ism_policy" "logs_cleanup" {
  policy_id = "delete_logs_after_12h"
  body      = file("${path.module}/policies/delete_logs_after_12h.json")
}

resource "opensearch_ism_policy" "metrics_cleanup" {
  policy_id = "delete_metrics_after_12h"
  body      = file("${path.module}/policies/delete_metrics_after_12h.json")
}
