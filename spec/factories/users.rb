FactoryGirl.define do
  factory :user do
    name      'Tom'
    password  '123123123'
    email     { |n| "user-#{n}@example.com" }
  end
end
