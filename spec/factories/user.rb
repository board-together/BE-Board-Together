FactoryBot.define do
  factory :user, class: User do
    username { Faker::Internet.unique.username }
  end
end
