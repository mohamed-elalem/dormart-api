json.(product, :id, :name, :description, :price, :quantity, :rate, :created_at, :updated_at)
json.rates_count product.rates.count
json.shop do
  json.partial! 'users/user', user: product.shop
end
json.category do
  json.partial! 'categories/category', category: product.category
end
json.links do
  json.self category_product_path(product.category, product)
end
