module "ithaca_k8s_cluster" {
  source = "./modules/k8s_cluster"

  cluster_name  = "ithaca"
  ssh_key       = var.ssh_key
  manager_count = 1
  worker_count  = 1
}
