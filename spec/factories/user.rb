FactoryBot.define do
    factory :user do
        nickname                {Faker::Name.initials(number: 20)}
        email                   {Faker::Internet.free_email}
        password                {"abc123" + Faker::Internet.password(min_length: 6)}
        password_confirmation   {password}
    end
  end