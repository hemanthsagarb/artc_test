variable "region"{
    default = "ap-southeast-2" 
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "438954004210",
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      username = "trusting-administratoraccess-role"
      rolearn  = "arn:aws:iam::438954004210:role/trusting-administratoraccess-role"
      groups = ["system:masters"]
    },
  ]
}
