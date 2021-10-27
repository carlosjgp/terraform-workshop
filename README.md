# terraform-workshop
A little workshop to explain some problems and pitfalls when managing IaC with Terraform and managing Terraform too

## Agenda

### IaC (infrastructure as code)

- [`terraform`](https://www.terraform.io/)
- [IaC](https://en.wikipedia.org/wiki/Infrastructure_as_code)

### terraform world (hello world)

Folder `01_hello_world`

Contains a simple example of a terraform module/project.

### terraform providers

Folder `02_providers`

Demostrates how to use terraform providers chained

### terraform backend

Folder `03_backend`

Keep the state somewhere safe! And use locks if there are concurrent changes.

### terraform functions

Folder `04_functions`

### terraform modules

Folder `05_modules`

### terraform workspaces

Folder `06_workspaces`

### terraform and pipelines (automation) no demo

- [Github Actions](https://learn.hashicorp.com/tutorials/terraform/github-actions)
- [Atlantis](https://www.runatlantis.io/)

### terraform and Kubernetes (operators) no demo

- [Official TF Cloud Operator](https://www.terraform.io/docs/cloud/integrations/kubernetes/index.html)
- [Rancher TF operator](https://github.com/rancher/terraform-controller)
- [`isaaguilar/terraform-operator`](https://github.com/isaaguilar/terraform-operator)

### terraform OSS vs cloud. No demo

- [Terraform Cloud](https://www.terraform.io/cloud)

### Pitfalls

#### Providers and modules versioning

Make sure you are confortable with the strategy to adopt versions

Be mindful of the providers and modules you are using and how their maintainers publish their verions.

- New patch versions might cause changes in your infrastructure
- No updating ofter will make it very painful to update when you really need to

#### Too much/little infrastrcure

Could lead into
  - Works when adding things. It doesn't on create from scratch, updating modules or destroying the whole thing.
  - [Cyclic dependencies](https://stackoverflow.com/questions/52353693/terraform-cyclic-dependency-in-apply-stage-when-using-depends-on-for-modul)

![Cyclic dependency](/docs/img/cyclic_deps.png)

#### Resources dependencies

Explicit vs implicit

#### Race conditions

eg: AWS IAM propagation

#### Drifted state

Some times some provider resources or just how we do code might change the same cloud resource on two different projects and they will constantly changing the other.

### Monorepo vs repo per project

Isolation vs easy to find

#### Terragrunt 

https://github.com/antonbabenko/terragrunt-reference-architecture

## Tools

### Managing

- [`tfenv`](https://github.com/tfutils/tfenv)
- [`terraenv`](https://github.com/aaratn/terraenv)
- [`terragrunt`](https://github.com/gruntwork-io/terragrunt)

###  Security

- [`tfsec`](https://github.com/aquasecurity/tfsec)
- [`terrascan`](https://github.com/accurics/terrascan)

### Testing

- [`terratest`](https://github.com/gruntwork-io/terratest)
- [`kitchen-terraform`](https://github.com/newcontext-oss/kitchen-terraform)
- [`Pulumi` ish](https://www.pulumi.com/)

### Visualise

#### Terraform graph

- [`terraform graph`](https://www.terraform.io/docs/internals/graph.html)

Using terraform and graphviz highlighting the cyclic dependencies with read

```
terraform plan -out tfplan
terraform graph -draw-cycles -module-depth=0 -plan=tfplan | dot -Tsvg > graph-apply.svg
```

#### Rover

- [`rover`](https://github.com/im2nguyen/rover)

```shell
$ docker run --rm -it -p 9000:9000 -v "$HOME/.aws":/root/.aws -v $(pwd):/src im2nguyen/rover
```

if terraform uses AWS provider... you might want to mount your AWS credentials or the `.aws` folder
```shell
-e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN
```

```shell
-v "$HOME/.aws":/root/.aws
```

#### terraform-visual

https://hieven.github.io/terraform-visual/plan-details

### Importing

- [terraformer](https://github.com/GoogleCloudPlatform/terraformer)

### Hygene

- [`pre-commit`](https://pre-commit.com/) including [Terraform hooks](https://github.com/antonbabenko/pre-commit-terraform)
- [`terraform-docs`](https://github.com/terraform-docs/terraform-docs)

# Reference
- [Terraform regitry](https://registry.terraform.io)
