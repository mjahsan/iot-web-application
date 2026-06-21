resource "aws_security_group" "rds" {
  name        = "landfill-rds-sg"
  description = "Allow PostgreSQL access from VPC"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "PostgreSQL"

    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"

    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "landfill-rds-sg"
  }
}

resource "aws_db_subnet_group" "postgres" {
  name = "landfill-db-subnet-group"

  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "landfill-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier = "landfill-postgres"

  engine         = "postgres"
  engine_version = "16.4"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "landfill_db"
  username = "postgres"
  password = var.db_password

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  db_subnet_group_name = aws_db_subnet_group.postgres.name

  tags = {
    Name = "landfill-postgres"
  }
}