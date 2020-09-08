FactoryBot.define do
  factory :cart_product do
    cart
    product
    quantity do
      Faker::Number.between(from: 1, to: product.quantity)
    end
  end
end
