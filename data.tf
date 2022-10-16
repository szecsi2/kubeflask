data "kubernetes_service" "redis-master" {
  metadata {
    name      = "redis"
    namespace = "minikubenamespace"
  }
}

