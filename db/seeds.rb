Game.destroy_all
User.destroy_all
Order.destroy_all

users = [
  { email: "seller@email.com", password: "teste123", password_confirmation: "teste123" },
  { email: "buyer@email.com", password: "teste123", password_confirmation: "teste123" },
]

users.each do |user|
  User.create!(user)
end

game = Game.new(
  name: "The Witcher 3: Wild Hunt",
  description: "Um RPG épico de mundo aberto.",
  category: "RPG",
  price: 10.00,
  user_id: User.first.id
)
game.image.attach(io: File.open("app/assets/images/seed-covers/the-witcher-3.png"), filename: "the-witcher-3.png", content_type: "image/jpg")

game.save!

game = Game.new(
  name: "Valorant",
  description: "Um jogo de tiro tático em equipe.",
  category: "FPS",
  price: 5.00,
  user_id: User.first.id
)
game.image.attach(io: File.open("app/assets/images/seed-covers/valorant.png"), filename: "valorant.png", content_type: "image/jpg")

game.save!

game = Game.new(
  name: "Blasphemous II",
  description: "Awakened in a strange new land, and displaced from his final resting place",
  category: "Adventure",
  price: 98.00,
  user_id: User.first.id
)
game.image.attach(io: File.open("app/assets/images/seed-covers/blasphemous-2.png"), filename: "blasphemous-2.png", content_type: "image/jpg")

game.save!

game = Game.new(
  name: "Warhammer: Chaosbane",
  description: "In a world ravaged by war and dominated by magic, you must rise up to face the Chaos hordes.",
  category: "RPG",
  price: 6.20,
  user_id: User.first.id
)
game.image.attach(io: File.open("app/assets/images/seed-covers/warhammer-chaosbane.png"), filename: "warhammer-chaosbane.png", content_type: "image/jpg")

game.save!
