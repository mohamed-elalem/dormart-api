FactoryBot.define do
  factory :rate do
    value { Faker::Number.between(from: 1, to: 5) }
    review { association :review, rate: nil, strategy: :build }
  end
end
