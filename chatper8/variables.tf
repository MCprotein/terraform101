variable "aws_region" {
  description = "region for aws."
}

variable "iam_user_list" {
  type = list(string)
}

variable "image_id" {
  type = string
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["ap-northeast-2c"]
}

variable "ami_id_maps" {
  type    = map(any)
  default = {}
}
