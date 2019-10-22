FactoryBot.define do
  factory :review do
    content { Faker::Lorem.sentences }
    status { :draft }

    trait :draft do
      status { :draft }
    end

    trait :published do 
      status { :published }
    end
  end
end
