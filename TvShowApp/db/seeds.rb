# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new
user.id = 1
user.name = 'admin'
user.password = '123456'
user.password_confirmation = '123456'
user.email = 'admin@tvshows.com'
user.admin = true
user.save!

user = User.new
user.id = 2
user.name = 'benja'
user.password = '123456'
user.password_confirmation = '123456'
user.email = 'benja@tvshows.com'
user.admin = false
user.save!

user = User.new
user.id = 3
user.name = 'ale'
user.password = '123456'
user.password_confirmation = '123456'
user.email = 'ale@tvshows.com'
user.admin = false
user.save!

user = User.new
user.id = 4
user.name = 'santi'
user.password = '123456'
user.password_confirmation = '123456'
user.email = 'santi@tvshows.com'
user.admin = false
user.save!

for i in 0..15
  show = TvShow.new
  show.name =Faker::Book.title
  #por alguna razon el nombre queda como nil...
  show.genre = Faker::Book.genre
  show.country = Faker::Address.country
  show.language = Faker::Lorem.word
  show.actors = Faker::Name.name
  show.director = Faker::Name.name
  show.seasons = Faker::Number.between(1,15)
  show.user_id = 1
  show.save!
end

for i in 1..3
  for j in 2..4

    show = TvShow.new
    show.name =Faker::Book.title
    #por alguna razon el nombre queda como nil...
    show.genre = Faker::Book.genre
    show.country = Faker::Address.country
    show.language = Faker::Lorem.word
    show.actors = Faker::Name.name
    show.director = Faker::Name.name
    show.seasons = Faker::Number.between(1,15)
    show.user_id = j
    show.save!
  end
end