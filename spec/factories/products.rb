FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 3)}
    category { Category.find_or_create_by(name: Faker::Commerce.department) }
    price { Faker::Commerce.price }
    quantity { Faker::Number.number(digits: 3) }
    shop
  end
end
