require 'uri'
require 'net/https'
require 'open-uri'

CATEGORY = %w[FPS Moba RPG MMO MMORPG Action Adventure Puzzle Sports Strategy Simulation Horror].freeze

Game.destroy_all
User.destroy_all
Order.destroy_all

users = [
  { email: "kaique@email.com",	password: "teste123", password_confirmation: "teste123" },
  { email: "rafael@email.com", password: "teste123", password_confirmation: "teste123" },
  { email: "anabacana@email.com", password: "teste123", password_confirmation: "teste123" },
  { email: "alyson@email.com", password: "teste123", password_confirmation: "teste123" }
]

users.each do |user|
  User.create!(user)
end

http = Net::HTTP.new('api.igdb.com', 443)
http.use_ssl = true

# criando request para pegar os jogos
request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => ENV['TWITCH_CLIENT_ID'], 'Authorization' => ENV['IGDB_AUTHORIZATION']})
request.body = 'fields name, summary, cover; where category = 0 & platforms = {48,6} & rating > 70; limit 30;'
response = http.request(request)
parsed_games = JSON.parse(response.read_body)

parsed_games.each do |game|
  added_game = Game.new(name: game["name"], description: game["summary"], category: CATEGORY.sample, price: rand(5..99), user_id: rand(1..4))
  request_cover = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/covers'), {'Client-ID' => ENV['TWITCH_CLIENT_ID'], 'Authorization' => ENV['IGDB_AUTHORIZATION']})
  request_cover.body = "fields image_id; where id = #{game['cover']};"
  response_cover = http.request(request_cover)
  parsed_cover = JSON.parse(response_cover.read_body)
  image = URI.parse("https://images.igdb.com/igdb/image/upload/t_cover_big/#{parsed_cover[0]['image_id']}.png").open
  added_game.image.attach(io: image, filename: "#{added_game.name}.png")
  added_game.save!
end
