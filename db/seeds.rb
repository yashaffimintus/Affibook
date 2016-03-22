# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   # admin = User.create([{first_name: 'yash'},{last_name: 'dabir'},{role: 'admin'},{email: 'yash@gmail.com'},{password: '123456789'},{password_confirmation: '123456789'}])

admin = User.create({first_name: "yash",last_name: "dabir", email: "yash@gmail.com", password: "123456789", password_confirmation: "123456789", role: '0'})
