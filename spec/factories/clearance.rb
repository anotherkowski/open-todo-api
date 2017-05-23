FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    name Faker::Internet.user_name(5..10)
    password "password"
  end
end
