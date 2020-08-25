json.product do
  json.name @product.name
  json.description @product.description
  json.price @product.price
  json.quantity @product.quantity
  json.category @product.category
  json.shop @product.shop
  json.created_at @product.created_at
  json.updated_at @product.updated_at
end