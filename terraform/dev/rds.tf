module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.20.0"
  allocated_storage = 60
  backup_window = "00:00-01:00"
  engine = "postgres"
  engine_version = "12.3"
  final_snapshot_identifier = "artc-dev"
  identifier = "artc-dev"
  instance_class = "db.t3.large"
  maintenance_window = "wed:02:00-wed:03:00"
  port = 5432
  username = aws_ssm_parameter.or_demo_rds_username.value
  password = aws_ssm_parameter.or_demo_rds_password.value
  availability_zone = "ap-southeast-2a"
  backup_retention_period = 14
  copy_tags_to_snapshot = true
  db_subnet_group_name =  aws_db_subnet_group.or_demo_rds_subnet_group.name
  deletion_protection = false
  iam_database_authentication_enabled = false
  create_db_parameter_group = false
  parameter_group_name = aws_db_parameter_group.or_demo_rds_pg.name
  option_group_name                     = "default:postgres-12"
  major_engine_version = "12"

  iops = 0
  kms_key_id                            = "arn:aws:kms:ap-southeast-2:438954004210:key/1d18a4d9-f831-4549-b75b-bc2457346d6a"
  name = "optimalreality"
  option_group_description = "default:postgres-12"
  storage_encrypted = true
  storage_type = "gp2"
  vpc_security_group_ids = [aws_security_group.or_demo_rds_security_group.id]
}


resource "aws_db_parameter_group" "or_demo_rds_pg" {
    description = "Postgres 12 RDS Parameter Group"
    family      = "postgres12"
    name        = "artc-dev-rds-dbparametergroup"
}


# provider "postgresql" {
#   alias    = "pg1"
#   scheme   = "awspostgres"
#   host     = module.rds.this_db_instance_endpoint
#   username = aws_ssm_parameter.or_demo_rds_username.value
#   port     = 5432
#   password = aws_ssm_parameter.or_demo_rds_password.value

#   superuser = false
# }


# resource "postgresql_database" "or_dot" {
#   provider = "postgresql.pg1"
#   name     = "or_dot"
# }


# resource "postgresql_database" "ordb" {
#   provider = "postgresql.pg1"
#   name     = "ordb"
# }


# resource "postgresql_role" "pgadmin" {
#   provider = "postgresql.pg1"
#   name     = "pgadmin"
#   login    = true
#   inherit = true
#   create_role = true
#   password = aws_ssm_parameter.or_demo_rds_password.value
# }

# resource "postgresql_role" "oradmin" {
#   provider = "postgresql.pg1"
#   name     = "oradmin"
#   login    = true
#   inherit = true
#   create_role = true
#   password = aws_ssm_parameter.or_demo_rds_password.value
# }
