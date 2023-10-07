module "k3s_cluster" {
  source = "./modules/k3s_cluster"

  ssh_key      = var.ssh_key
  server_count = 1
  agent_count  = 1
}
