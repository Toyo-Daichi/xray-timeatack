resource "aws_ssm_parameter" "xray-ssm-parm" {
  name = "xray-ssm-parm"
  type = "String"
  value = "Hello World from ssm parameter store!"
}