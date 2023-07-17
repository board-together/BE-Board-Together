FactoryBot.define do
  factory :user_game, class: UserGame do
    status { Faker::Number.within(range: 0..2) }
    borrower_id { [nil, Faker::Number.within(range: 0..2)].sample }
    user factory: %i[user]
    game factory: %i[game]
  end
end
