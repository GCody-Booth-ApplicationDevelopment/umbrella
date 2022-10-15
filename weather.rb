p "Where are you located"

# user_location = gets.chomp
user_location = "Gleacher Center"
user_location = user_location.gsub(" ", "%20")

p user_location

# gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"



require("open-uri")
gmap_output =  URI.open(gmaps_url).read
#puts gmap_output

require("json")
parsed_data = JSON.parse(gmap_output)
results_array = parsed_data.fetch("results")
first_results = results_array.at(0)
p first_results.keys
geo = first_results.fetch("geometry")
loc = geo.fetch("location")
latitude =  loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude
p longitude

#use coords from gmaps to compose URL. Read, parse and print current temp. read probability of precipitation. create conditional to reccomend umbrella or not 

#Dark ski url
