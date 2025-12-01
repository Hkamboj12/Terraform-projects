variable "vpc-cidr" {
    description = "This variable is used for vpc cidr range"
    default =   "10.0.0.0/16"
}

variable "subnet1-cidr" {
    description = "This variable is used for subnet1 cird range"
    default = "10.0.1.0/24"  
}

variable "subnet2-cidr" {
    description = "This variable is used for subnet2 cird range"
    default = "10.0.2.0/24"
}
