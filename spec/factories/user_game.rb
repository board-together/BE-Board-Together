FactoryBot.define do
  factory :user_game, class: UserGame do
    status { Faker::Number.within(range: 0..2) }
    association :user, factory: :user
    association :game, factory: :game
  end
end
