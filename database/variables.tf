variable "apply-immediately" {
  default = false
  type    = bool
}

variable "db-name" {
  type = string
}

variable "db-subnet-group-name" {
  type = string
}

variable "engine" {
  default = "postgres"
  type    = string
}

variable "engine-version" {
  default = "14.5"
  type    = string
}

variable "identifier" {
  type = string
}

variable "instance-class" {
  default = "db.t3.micro"
  type    = string
}

variable "parameter-group-name" {
  default = "default.postgres14"
  type    = string
}

variable "password" {
  type = string
}

variable "port" {
  default = 5432
  type    = number
}

variable "publicly-accessible" {
  default = false
  type    = bool
}

variable "username" {
  type = string
}

variable "vpc-security-group-ids" {
  default = []
  type    = list(string)
}

variable "allocated-storage" {
  default = 20
  type    = number
}

variable "storage-type" {
  default = "gp2"
  type    = string
}

variable "skip-final-snapshot" {
  default = true
  type    = bool
}
