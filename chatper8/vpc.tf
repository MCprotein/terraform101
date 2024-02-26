# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "terraform-101"
#   }
# }


# resource "aws_subnet" "public_subnet" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.0.0/24"

#   availability_zone = "ap-northeast-2a"

#   tags = {
#     Name = "terraform-101-public-subnet"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.10.0/24"

#   tags = {
#     Name = "terraform-101-private-subnet"
#   }
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "terraform-101-igw"
#   }
# }

# resource "aws_eip" "nat" {
#   domain = "vpc"

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.nat.id

#   # NAT 게이트웨이는 public subnet에 위치해야한다.
#   subnet_id = aws_subnet.public_subnet.id

#   tags = {
#     Name = "terraform-NATGW"
#   }
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "terraform-101-rt-public"
#   }
# }

# resource "aws_route_table_association" "route_table_association_public" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "terraform-101-rt-private"
#   }
# }

# resource "aws_route_table_association" "route_table_association_private" {
#   subnet_id      = aws_subnet.private_subnet.id
#   route_table_id = aws_route_table.private.id
# }

# resource "aws_route" "private_nat" {
#   route_table_id         = aws_route_table.private.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat_gateway.id
# }

# # 숙제 (강의에서 진행하지 않는 내용)
# resource "aws_vpc_endpoint" "s3_endpoint" {
#   vpc_id       = aws_vpc.main.id
#   service_name = "com.amazonaws.ap-northeast-2.s3"

#   tags = {
#     Name = "terraform-101-vpc-endpoint-s3"
#   }
# }

# resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_route_table_association" {
#   route_table_id  = aws_route_table.private.id
#   vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint.id
# }
