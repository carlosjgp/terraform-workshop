terraform {
  backend "kubernetes" {
    secret_suffix    = "03-backend"
    load_config_file = true
    config_context   = "kind-terraform-state"
  }
}
