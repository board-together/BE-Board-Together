FactoryBot.define do
  factory :user, class: User do
    username { Faker::Internet.username }
  end
end
