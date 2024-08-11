terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

data "docker_image" "alpine" {
  name = "alpine:latest"
}

resource "docker_container" "techdev" {
  name  = "techdev"
  image = "nginx:alpine"

  ports {
    internal = 80
    external = 8000

  }

}