FactoryBot.define do
  factory :user_game, class: UserGame do
    status { Faker::Number.within(range: 0..2) }
    borrower_id { [nil, Faker::Number.within(range: 0..2)].sample }
    association :user, factory: :user
    association :game, factory: :game
  end
end
