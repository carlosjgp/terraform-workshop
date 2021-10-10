terraform {
  backend "kubernetes" {
    secret_suffix    = "04-functions"
    load_config_file = true
    config_context   = "kind-terraform-state"
  }
}
