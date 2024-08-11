# Docker-Nginx-Terraform

This project uses Terraform to provision and manage a Docker container running an Nginx web server.

## Description

This Terraform configuration sets up a Docker container running the Nginx web server using the Alpine Linux-based image. It exposes the web server on port 8000 of the host machine.

## Prerequisites

- Terraform (version compatible with ~> 3.0.2 of the Docker provider)
- Docker

## Installation

1. Clone this repository:
   ```
   git clone git@github.com:NajmeM/Terraform.git
   cd Docker-Nginx-Terraform
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

## Usage

1. Review the `main.tf` file to ensure the configuration meets your needs.

2. Plan the Terraform execution:
   ```
   terraform plan
   ```

3. Apply the Terraform configuration:
   ```
   terraform apply
   ```

4. After applying, you should be able to access the Nginx welcome page at `http://localhost:8000`.

5. To stop and remove the container, run:
   ```
   terraform destroy
   ```

## Configuration Details

- The Docker provider is configured to use the Windows named pipe for communication with the Docker daemon.
- The Nginx container is named "techdev".
- The container exposes port 80 internally, which is mapped to port 8000 on the host.

## Dependencies

This project uses the following Terraform provider:
- Docker Provider by kreuzwerker (version ~> 3.0.2)

## License

This project is open source and available under the [Apache](LICENSE).


