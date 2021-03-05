resource "aws_iam_role" "test_role" {
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRoleWithWebIdentity"
                    Effect    = "Allow"
                    Principal = {
                        Federated = "arn:aws:iam::438954004210:oidc-provider/oidc.eks.ap-southeast-2.amazonaws.com/id/2E864B9D160EF5CFD5493B162D1A8229"
                    }
                },
            ]
            Version   = "2012-10-17"
        }
    )
    force_detach_policies = false
    max_session_duration  = 3600
    path                  = "/"
    permissions_boundary  = "arn:aws:iam::438954004210:policy/DeloittePermissionsBoundaryPolicy"
}