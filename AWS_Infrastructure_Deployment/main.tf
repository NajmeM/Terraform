#1-create VPC
resource "aws_vpc" "tech-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Technical-dep"
  }
}

#2-create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tech-vpc.id
}
#3-Create Custome Route Table
resource "aws_route_table" "tech-route-table" {
  vpc_id = aws_vpc.tech-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "tech-route"
  }
}
#4-Create a Subnet
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.tech-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-north-1b"

  tags = {
    Name = "ip-subnet"
  }
}
#5-Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.tech-route-table.id
}
#6-Create Security Group to Allow port 22,80,443
resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.tech-vpc.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #any port
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}
#7-Create a network interface with an IP in the subnet that was created in step4
resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.55"]
  security_groups = [aws_security_group.allow_web.id]
}

#8-Assign an elastic IP to the network interface created in step7
resource "aws_eip" "one" {
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.55"
  depends_on = [aws_internet_gateway.gw]
}
#9-Create Ubuntu server and install/enable apache2
resource "aws_instance" "testweb" {
    ami           = "ami-0014ce3e52359afbd"
    instance_type = "t3.micro"
    availability_zone = "eu-north-1b"
    key_name = "ansible-key"

    network_interface {
      device_index = 0
      network_interface_id = aws_network_interface.web-server-nic.id
    }
    user_data = <<-EOF
      #!/bin/bash
      sudo apt update -y
      sudo apt install apache2 -y
      sudo systemctl start apache2
      echo "This is my first web server" > /var/www/html/index.html
    EOF

    tags = {
        Name = "web-server-created-by-terraform"
    }   
 }