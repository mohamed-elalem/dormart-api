FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    password { Faker::Crypto.md5 }
    password_confirmation { password }
    email_confirmation { email }
    confirmed_at { DateTime.now }
  end
  
  factory :shop, parent: :user, class: 'Shop'
  factory :customer, parent: :user, class: 'Customer'
end