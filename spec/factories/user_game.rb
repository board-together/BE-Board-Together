FactoryBot.define do
  factory :user_game, class: UserGame do
    status { Faker::Number.within(range: 0..2) }
    borrower_id { [nil, Faker::Number.within(range: 0..2)].sample }
    association :user, factory: :user
    association :game, factory: :game
    
    after(:build) do |user_game, evaluator|
      if user_game.borrower_id.present?
        user_game.status = 1
      end
    end
  end
end 
