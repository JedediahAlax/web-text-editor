# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "fooooooobar",
             password_confirmation: "fooooooobar",
             activated: true,
             activated_at: Time.zone.now)

users = User.order(:created_at).take(1)
50.times do
  content = "Document Title"
  users.each { |user| user.documents.create!(content: content) }
end
