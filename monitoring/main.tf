module "kube" {
  source = "./modules/kube-prometheus"
  kube-version = "36.2.0"
}
