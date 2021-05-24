# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin restaurant
restaurant = Restaurant.create!(name: 'Admin', cuisines: 'veg', phone: '242342342', email: 'admin@gmail.com', location: 'Dubai',
                   open_hours: 'Mon-Fri')

# Admin User
User.create!(first_name: 'Admin', last_name: 'Eatapp', email: 'admin@gmail.com', phone: '1234322423',
             role: 'admin', restaurant_id: restaurant.id, password: '123456', password_confirmation: '123456')

# bad user with role fake
User.create!(first_name: 'Fake', last_name: 'Eatapp', email: 'fake@gmail.com', phone: '1234322423',
                          role: 'fake', restaurant_id: restaurant.id, password: '123456', password_confirmation: '123456')
