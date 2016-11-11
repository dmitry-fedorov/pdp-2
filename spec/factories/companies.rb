FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    domain { Faker::Lorem.word }
  end
end
