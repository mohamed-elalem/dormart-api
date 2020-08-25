FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department }
    description { Faker::Lorem.paragraph(sentence_count: 3)}
  end
end