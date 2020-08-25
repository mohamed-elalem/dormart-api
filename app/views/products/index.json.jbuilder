json.current_page @products.current_page
json.total_pages @products.total_pages
json.products do
  json.partial! 'product', collection: @products, as: :product
end