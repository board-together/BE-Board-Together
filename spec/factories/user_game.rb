FactoryBot.define do
  factory :user_game, class: UserGame do
    status { Faker::Number.within(range: 0..2) }
    borrower_id { [nil, User.pluck(:id).sample].sample }
    user factory: %i[user]
    game factory: %i[game]
  end
end
