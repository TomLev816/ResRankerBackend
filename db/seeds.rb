# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create({ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(first: 'name', last:'lastname', username: 'yaboi', restaurants_visited: 50, image_src: 'tom.com', total_restaurants_ranked: 12)

restaurant = Restaurant.create(name: 'Star Wars', address: '123 1st', cuisine: 'mexican', location_lat: 45.0, location_long: 50.0, visitors:4, image_src: 'myurl.com')


ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 1, ranking: 5)

visit = Visit.create(user_id: 1, restaurant_id: 1, date: 'monday', comment:'it was bad')
