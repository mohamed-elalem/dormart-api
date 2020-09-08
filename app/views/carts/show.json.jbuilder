json.array! @cart.cart_products do |cart_product|
  json.partial! 'products/product', product: cart_product.product
  json.ordered_quantity cart_product.quantity
end