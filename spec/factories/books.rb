FactoryBot.define do
  factory :book do
    title { Faker::Lorem.sentences }
  end
end
