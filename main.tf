terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.region
}

resource "aws_security_group" "resolver_sg" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  ingress {
    description      = "Resolver Endpoint Egress rule to open port 53"
    protocol         = "udp"
    from_port        = var.dns_port
    to_port          = var.dns_port
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.local_internet_cidr]
  }

  tags = var.tags
}

resource "aws_route53_resolver_endpoint" "resolver_endpoint" {
  name      = var.resolver_endpoint_name
  direction = var.direction

  security_group_ids = [aws_security_group.resolver_sg.id]

  ip_address {
    subnet_id = var.subnet_id_1
  }

  ip_address {
    subnet_id = var.subnet_id_2
  }

  protocols = var.protocol

  tags = var.tags
}