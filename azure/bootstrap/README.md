This will bootstrap the Azure + Terraform installation.

Keep the bootstrap terraform state stored in a very restricted place. For example, you can
segment security by adding these kind of bootstrapping states to terraform cloud where only few admins
would have access to.

For this example, we're keeping it local (bad idea for real envs).

This workspace should not be run within a CI/CD and should need az login with admin privileges to happen.