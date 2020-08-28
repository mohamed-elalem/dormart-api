FactoryBot.define do
  factory :category do
    transient do
      realistic { false }
    end
    name { if realistic then Faker::Commerce.department else SecureRandom.hex end }
    description { Faker::Lorem.paragraph(sentence_count: 3)}
  end
end