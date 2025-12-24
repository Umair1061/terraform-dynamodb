variable "table_name" {
    type = string
    default = "order_table" 
}

variable "billing_mode" {
    type = string
    default = "PAY_PER_REQUEST" 
}

variable "hash_key" {
    type = string
    default = "user_id" 
}

variable "range_key" {
    type = string
    default = "order_id" 
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project = "DynamoDB-Autoamtion"
  }
}

variable "gsi_hash_key" {
  type = string
  default = "order_status"
}