FactoryBot.define do
  factory :game do
    board_game_atlas_id { Faker::Number.hexadecimal(digits: 6) } 
    name { Faker::Game.title } 
    min_players { Faker::Number.within(range: 1..2) } 
    max_players { Faker::Number.within(range: 2..20) } 
    min_playtime { Faker::Number.within(range: 1..45) } 
    max_playtime { Faker::Number.within(range: 2..60) } 
    min_age { Faker::Number.between(from: 1, to: 16) } 
    year_published { Faker::Number.between(from: 1900..2023) } 
    description { Faker::Lorem.paragraph } 
    thumb_url { Faker::Internet.url } 
    image_url { Faker::LoremFlickr.image } 
    url { Faker::Internet.url }
  end
end