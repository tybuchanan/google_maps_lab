# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pin.create!([{ lat: 37.779894, long: -122.394879 }])
Pin.create!([{ lat: 60, long: -105}])
Pin.create!([{ lat: 40.69847032728747, long: -73.9514422416687}])
Pin.create!([{ lat: 44.58, long: -95.46}])

# User.create!([{ email: "tyler@tyler.com", password: "password123", password_confirmation: "password123"}])
