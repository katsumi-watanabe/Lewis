FactoryBot.define do
  factory :comment do
    association :user
    association :post_sneaker
    comment { Faker::Lorem.characters(number: 10) }
  end
end