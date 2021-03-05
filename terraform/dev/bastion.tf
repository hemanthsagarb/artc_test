module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"


  name                        = "artc-dev-bastion"
  ami                         = "ami-04fcc97b5f6edcd89"
  instance_type               = "t3.medium"
  subnet_id                   =  module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name = "asa-atm-test-key"
  vpc_security_group_ids = [aws_security_group.bastion_test.id]
}