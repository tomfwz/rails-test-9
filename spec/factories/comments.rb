FactoryGirl.define do
  factory :comment do
    message 'I want to hire you!'
    user    { user }
  end
end
