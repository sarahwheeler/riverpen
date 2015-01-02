# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  email = Faker::Internet.email
  username = Faker::Internet.user_name
  password = Faker::Internet.password(8)
  User.create!(:email => email, :username => username, :password => password)
end