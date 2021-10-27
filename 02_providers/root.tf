provider "kind" {
  provider   = "docker"
  kubeconfig = pathexpand("~/.kube/kind-config")
}

provider "kubernetes" {
  host = kind_cluster.test.server

  client_certificate     = base64decode(kind_cluster.test.client_certificate_data)
  client_key             = base64decode(kind_cluster.test.client_key_data)
  cluster_ca_certificate = base64decode(kind_cluster.test.ca_certificate_data)
}

provider "aws" {
  region = "eu-west-1"
}


provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}
