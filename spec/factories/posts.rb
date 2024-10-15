require 'faker'

FactoryBot.define  do
     factory :post do
          title { Faker::Lorem.sentence(word_count: 10) }
          content { Faker::Lorem.sentence(word_count: 100) }
     end

     factory :post_with_user, class: Post do
          title { Faker::Lorem.sentence(word_count: 10) }
          content { Faker::Lorem.sentence(word_count: 100) }
          association :user
     end

  #  factory :empty_post, class: Post do
  #  end
end
