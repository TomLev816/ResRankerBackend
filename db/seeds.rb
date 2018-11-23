# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create({ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "http"
require "json"
require "optparse"
require 'pry'


user = User.create(first: 'name', last:'lastname', username: 'yaboi', restaurants_visited: 50, image_src: 'tom.com', total_restaurants_ranked: 12)




firstYelpKey = "qw9eiFVUi1fOAu0VD4X5Z_pklCcNIUfy8WuQa594EOmthm7NXXYEvV8QmdfYn9czOp2VDSs-9s90qvl7evKUm2Nc9HvhdMxE5gGHXEctHAq5pQculvYHNqTm8TnwW3Yx"

secondYelpKey = "UQOowjKGaEk453tdAubg-eHbJFT9RXG4Ku1yJr4rKhHe8j5Ejo4qLOV6Vit6IXNx3xI8DpNnXvjhcb0IINfdqfKXGSe7K2jEoZWfaO6iKXfVFgDE7Na7ZLMW0imYW3Yx"

API_KEY = firstYelpKey

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"

def search(term, location, offset)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: 50,
    offset: offset
  }
  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end

def add_restaurants()
  offset = 0
  while offset < 100
    search_result = search("restaurants", 'New York City', offset)
    i = 0
    while i < 50
      name = search_result["businesses"][i]["name"]
      display_address = search_result["businesses"][i]["location"]["display_address"][0]
      category = search_result["businesses"][i]["categories"][0]["alias"]
      image_url = search_result["businesses"][i]["image_url"]
      latitude = search_result["businesses"][i]["coordinates"]["latitude"]
      longitude = search_result["businesses"][i]["coordinates"]["longitude"]
      puts "#{i}"
      if Restaurant.exists?(name: name)
        i += 1
      else
        Restaurant.create(name: name, address: display_address, cuisine: category, location_lat: latitude, location_long: longitude, visitors:0, image_src: image_url)
        i += 1
      end #end of if
    end #end of i < 50 while
  offset += 51
  end #end offset < 500
end #end of add_restaurants

add_restaurants()

ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 1, ranking: 5)
visit = Visit.create(user_id: 1, restaurant_id: 1, date: 'monday', comment:'it was bad')
