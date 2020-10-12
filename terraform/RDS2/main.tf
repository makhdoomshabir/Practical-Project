resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "userdb"
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql8.0"
}
