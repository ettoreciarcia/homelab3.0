module "kubernetes" {
  source     = "./modules/k8s-cluster"
  kubernetes = var.kubernetes
}
