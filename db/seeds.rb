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


user = User.create(first: 'Barack', last:'Obama', username: 'a', restaurants_visited: 4, image_src: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/President_Barack_Obama.jpg/960px-President_Barack_Obama.jpg', total_restaurants_ranked: 3)




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

ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 1, ranking: 1)
ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 2, ranking: 3)
ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 3, ranking: 4)
ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 4, ranking: 5)
ranking = UserRestaurantRanking.create(user_id: 1 , restaurant_id: 5, ranking: 2)

visit = Visit.create(user_id: 1, restaurant_id: 1, date: '11/1/18', comment:'it was amazing')
visit = Visit.create(user_id: 1, restaurant_id: 2, date: '11/2/18', comment:'its ws n mela')
visit = Visit.create(user_id: 1, restaurant_id: 3, date: '11/4/18', comment:'some ogf the goor eaf eataible')
visit = Visit.create(user_id: 1, restaurant_id: 1, date: '11/12/18', comment:'lorems itso puaot mand')
visit = Visit.create(user_id: 1, restaurant_id: 4, date: '11/14/18', comment:'some ogf the goor I rmka thwn f eataible')
visit = Visit.create(user_id: 1, restaurant_id: 5, date: '11/20/18', comment:'some ogf the goor eaf jkalee eataible')
