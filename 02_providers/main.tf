/*
 * # 02 providers
 */
resource "kind_cluster" "test" {
  name   = "test"
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        - role: control-plane
        - role: worker
        - role: worker
    EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "kubernetes_namespace" "tf_provider" {
  metadata {
    name = "tf-provider"
  }
}