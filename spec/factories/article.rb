FactoryGirl.define do
  factory :article do
    name { Faker::Book.title }
    text { Faker::Lorem.sentence }
  end
end
