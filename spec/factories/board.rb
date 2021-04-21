FactoryBot.define do
    factory :board do
      title {Faker::Lorem.sentence}
      text {Faker::Lorem.sentence}   
      image {Faker::Lorem.sentence}
      association :user
    end
  end