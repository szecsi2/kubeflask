resource "kubernetes_namespace" "minikubenamespace" {
  metadata {
        name = "minikubenamespace"
  }
}
resource "helm_release" "local" {
  name          = "app"
  chart         = "./app"
  namespace     = "minikubenamespace"
}

resource "helm_release" "redis" {
  name = "redis"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  namespace  = "minikubenamespace"
  create_namespace = true

  set {
    name  = "auth.enabled"
    value = "false"
  }

  set {
    name  = "master.containerPort"
    value = "6379"
  }

  set {
    name  = "replica.replicaCount"
    value = "2"
  }
}


