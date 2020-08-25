FactoryBot.define do
  factory :review do
    transient do
      parent_association { false }      
    end

    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentences(number: 3).join }
    product
    customer
    rate { association :rate, review: nil, strategy: :build }
  end
end
