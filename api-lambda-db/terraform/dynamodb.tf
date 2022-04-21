resource "aws_dynamodb_table" "xray-dynamodb-table" {
  name = "xray-dynamodb-table"
  billing_mode = "PROVISIONED"
  read_capacity = 1
  write_capacity = 1
  hash_key = "name"

  attribute {
    name = "name"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "xray-dynadmodb-item" {
  table_name = aws_dynamodb_table.xray-dynamodb-table.name
  hash_key = aws_dynamodb_table.xray-dynamodb-table.hash_key
  #
  item = <<ITEM
{ 
  "name": {"S": "messages"},
  "contents": {"S": "Hello World from dynamodb!"}
}
ITEM
}