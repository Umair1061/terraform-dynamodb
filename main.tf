
resource "aws_dynamodb_table" "orders" {
  name = var.table_name
  billing_mode = var.billing_mode
  hash_key = var.hash_key
  range_key = var.range_key

  attribute {
    name = var.hash_key
    type = "S"
  }
  attribute {
    name = var.range_key
    type = "S"
  }
  attribute {
    name = "order_status"
    type = "S"
  }
  global_secondary_index {
    name = "OrderStatus"
    hash_key = var.gsi_hash_key
    projection_type = "ALL"
  }
  point_in_time_recovery {
    enabled = true
  }
  ttl {
    attribute_name = "ttl"
    enabled = true
  }
  server_side_encryption {
    enabled = true
  }
  tags = var.tags
}

resource "aws_dynamodb_table_item" "order1" {
  table_name = aws_dynamodb_table.orders.name
  hash_key = var.hash_key
  range_key = var.range_key

  item = jsonencode({
    user_id = {"S" = "U-101"}
    order_id = {"S" = "0-132"}
    product = {"S" = "Laptop"}
    price = {"N" = "100000"}
    order_status= {"S" = "Confirmed"}
    ttl = {"N" = "11728394"}
  })
}