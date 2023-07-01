
locals {
    vis_state = templatefile("${path.module}/templates/memory_allocation_vis_state_service_a.json", {})
    memory_allocation_visualization_body = templatefile("${path.module}/templates/example_visualization.json", {vis_state = jsonencode(local.vis_state)})
}

resource "elasticsearch_kibana_object" "test_visualization_v7" {
  body = local.memory_allocation_visualization_body
}