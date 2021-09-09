FactoryBot.define do
  factory :post_sneaker do
    association :user
    post_image_id { true }
    gender_selection { 1 }
    sneakers_name { Faker::Lorem.characters(number: 30) }
    caption { Faker::Lorem.characters(number: 90) }
  end
end