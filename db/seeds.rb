# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Alonzo	Castro", email: 'alonzo@gmail.com',
            position: 'Ruby on Rails Developer', password: 'demo',
            password_confirmation: 'demo', is_manager: 'false')

User.create(name: "James	Price", email: 'james@gmail.com',
            position: 'Ruby on Rails Developer', password: 'demo',
            password_confirmation: 'demo', is_manager: 'false')

User.create(name: 'Sherman Christensen', email: 'sherman@gmail.com',
            position: 'CEO Chairman', password: 'demo',
            password_confirmation: 'demo', is_manager: 'true')

User.create(name: 'Darin	Bates', email: 'darin@gmail.com',
            position: 'HR Manager', password: 'demo',
            password_confirmation: 'demo', is_manager: 'true')
