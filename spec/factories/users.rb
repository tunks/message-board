require 'faker'

FactoryBot.define do
  factory :user do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email(domain: 'localhost.dev') }
      password { '12345' }
  end

  factory :user_with_invalid_email, class: User  do
      email { 'test1@local123' }
      password { '12345' }
  end
end
