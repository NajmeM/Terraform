
# Grafana User Management with Terraform

This project automates the management of Grafana users using Terraform. The code provisions user accounts in Grafana, allowing for easy management of user credentials, roles, and teams through a declarative approach.

## Features

- **Automated User Creation**: Create multiple Grafana user accounts based on a provided list of users.
- **Customizable Roles**: Assign admin roles or standard user roles to each Grafana user.
- **Secure Password Management**: Store and manage user passwords securely using Terraform variables.
- **Team Management (Optional)**: Manage Grafana teams and assign users to specific teams (currently commented out).

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- Access to a Grafana instance where you have administrative rights.

## Terraform Provider Configuration

This project requires the Grafana Terraform provider to manage Grafana resources. Below is the configuration for the provider:

```hcl
terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 3.7"
    }
  }
}

provider "grafana" {
  url  = "http://localhost:3000/"
  auth = "admin:admin"
}
```

- **Provider Source**: The Grafana provider is sourced from the Terraform registry (`grafana/grafana`).
- **Version**: The provider version is set to `~> 3.7`, ensuring compatibility with the Terraform configuration.
- **URL**: The URL of your Grafana instance. By default, Grafana runs on `http://localhost:3000/`.
- **Auth**: The authentication credentials in the format `username:password`. Replace `admin:admin` with your actual admin credentials.

## User Configuration

Define the users to be managed in Grafana using the `users` variable. Here is an example configuration:

```hcl
variable "users" {
  type = map(object({
    password = string
    is_admin = bool
  }))
  description = "Lists of Grafana Users"
  default = {
    "najme" = {
      password = "najme123"
      is_admin = true
    },
    "mehdi" = {
      password = "mehdi456"
      is_admin = false
    },
    "dws" = {
      password = "dws789"
      is_admin = true
    },
    "test" = {
      password = "test1"
      is_admin = false
    }
  }
}
```

- **Variable `users`**: A map containing user configurations. Each user has a `password` and an `is_admin` flag indicating whether the user should have admin privileges.

### Optional: Grafana Password Variable

You might have considered using a separate variable for the Grafana admin password:

```hcl
# variable "g_pass" {
#   type        = string
#   description = "Grafana Password"
# }
```

This variable is commented out but can be used to store the Grafana admin password securely.

## Initialize and Apply

To apply the configuration:

```bash
terraform init
terraform apply
```

This will create the specified users in your Grafana instance.

## Project Visualization

The following graph represents the dependencies and relationships within this Terraform project, helping to understand how different resources and variables interact.

![Terraform Dependency Graph](images/terraform2.png)


## Future Enhancements

- **Team Management**: Uncomment and enhance the `grafana_team` resource to manage user teams within Grafana.
- **Automated Testing**: Introduce automated tests using `null_resource` or similar for verifying successful user creation.
## License

This project is licensed under the Apache License. See the `LICENSE` file for details.

## Acknowledgments

- Thanks to the Terraform and Grafana teams for their excellent tools and documentation.
