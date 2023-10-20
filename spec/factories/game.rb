FactoryBot.define do
  factory :game, class: Game do
    min_players = Faker::Number.within(range: 1..2)
    min_playtime = Faker::Number.within(range: 1..45)

    board_game_atlas_id { Faker::Number.unique.hexadecimal(digits: 6) }
    name { Faker::Game.title }
    min_players { min_players }
    max_players { Faker::Number.within(range: min_players..20) }
    min_playtime { min_playtime }
    max_playtime { Faker::Number.within(range: min_playtime..60) }
    min_age { Faker::Number.between(from: 1, to: 16) }
    year_published { Faker::Number.within(range: 1900..2023) }
    description { Faker::Lorem.paragraph }
    thumb_url { Faker::Placeholdit.image }
    image_url { Faker::Placeholdit.image }
    url { Faker::Internet.url }
  end
end
