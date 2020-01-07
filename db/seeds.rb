# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Post.destroy_all

puts "creating 2 new users"
puts "creating user 1"

file = URI.open('http://www.premiere.fr/sites/default/files/styles/scale_crop_1280x720/public/2018-08/big.jpg')
user1 = User.create!(password: "azerty", username: "thedude", email: "a@gmail.com")
user1.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
user1.save!
puts "user 1 created"

puts "creating user 1"
file2 = URI.open('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9fit=crop&w=1534&q=80
')
user2 = User.create!(password: "azerty", username: "hotgirl", email: "b@gmail.com")
user2.photo.attach(io: file2, filename: 'some-image2.jpg', content_type: 'image/jpg')
# Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
user2.save!
puts "user 2 created"




puts "creating new posts"

url = "https://source.unsplash.com/featured/?{art},{nature}"

8.times do
  post = Post.new(
    user: User.first,
    description: Faker::Quote.yoda,
  )
  url = "https://source.unsplash.com/featured/?{art},{nature}"
  file = URI.open(url)
  post.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
  post.save!
end

8.times do
  post = Post.new(
    user: User.second,
    description: Faker::Quote.yoda,
  )
  url = "https://source.unsplash.com/featured/?{art},{nature}"
  file = URI.open(url)
  post.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
  post.save!
end



# puts "creating new post #2"
# url = "https://source.unsplash.com/featured/?{art},{nature}"
# file = URI.open(url)
# post2 = Post.create!(user: User.first, description: 'This is a new post')
# post2.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# # Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
# post2.save!

# puts "creating new post #3"
# url = "https://source.unsplash.com/featured/?{art},{nature}"
# file = URI.open(url)
# post3 = Post.create!(user: User.first, description: 'This is a new post')
# post3.photo.attach(io: file, filename: 'some-image.jpg', content_type: 'image/jpg')
# # Here we write article.photo.attach(...) because we wrote has_one_attached :photo in app/models article.rb
# post3.save!

puts "done"

