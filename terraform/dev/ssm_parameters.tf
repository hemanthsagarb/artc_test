resource "aws_ssm_parameter" "or_demo_rds_password" {
    name = "/artc/dev/optimalreality/postgresql_password"
    type        = "SecureString"
    value       = "MyLongSecurePassword!"
}

resource "aws_ssm_parameter" "or_demo_rds_username" {
    name = "/artc/dev/optimalreality/postgresql_username"
    type        = "SecureString"
    value       = "pgadmin"
}


resource "aws_ssm_parameter" "or_demo_master_password" {
    name = "/artc/dev/optimalreality/master_password"
    type        = "SecureString"
    value       = "MyLongSecurePassword!"
}
