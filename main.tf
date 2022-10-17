resource "kubernetes_namespace" "minikubenamespace" {
  metadata {
        name = "minikubenamespace"
  }
}

resource "helm_release" "flask" {
  name          = "deploy-flask"
  chart         = "./deploy-flask"
  namespace     = "minikubenamespace"
  wait          = false
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

  set {
    name = "volumePermissions.enabled" 
    value = "true" 
  }

  set {
    name  = "persistence.storageClass"
    value = "nfs-client"
  }

  set {
    name  = "redis.replicas.persistence.storageClass"
    value = "nfs-client"
  }

}


