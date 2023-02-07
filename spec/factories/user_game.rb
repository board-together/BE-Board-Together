FactoryBot.define do
  factory :user_game do
    user
    game
    status { Faker::Number.within(range: 0..2) }
  end
end
