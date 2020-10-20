# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Traveler.destroy_all
Trip.destroy_all
Location.destroy_all
Hotel.destroy_all
Room.destroy_all

locations = ["Portland, Maine", "Washington, DC", "Orlando, Florida", "Denver, Colorado", "Sanfrancisco, California"]
images = [
    # "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/portland.jpg",
    # "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/dc.jpg",
    # "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/orlando_florida.jpg",
    # "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/Denver colorado.jpg",
    # "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/San Franscisco.jpg"
    
    "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/portland.jpg",
    "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/dc.jpg",
     "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/orlando_florida.jpg",
     "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/Denver colorado.jpg",
     "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/San Franscisco.jpg"
]

# "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/portland.jpg",
# "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/dc.jpg",
# "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/orlando_florida.jpg",
# "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/Denver colorado.jpg",
# "/Users/kevinsheehan/Documents/Flatiron/dc-web-082420/Project-3/San Franscisco.jpg"

# "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/portland.jpg",
# "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/dc.jpg",
# "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/orlando_florida.jpg",
# "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/Denver colorado.jpg",
# "/Users/alexstephane/Desktop/course_WORK/flatiron_course/dc-web-082420/phase_3/Project-3-Travel-App/San Franscisco.jpg"

longitude = [
    43.6591,
    38.9072,
    28.5383,
    39.7392,
    37.7749
]

latitude = [
    -70.2568,
    -77.0369,
    -81.3792,
    -104.9903,
    -122.4194
]
Traveler.create(name: Faker::Name.unique.name)

iterator = 0
locations.each do |location|
    Location.create(name: location, number_of_visits: 0, rating: 0.0, image: images[iterator], longitude: longitude[iterator], latitude: latitude[iterator])
    iterator += 1
end

(25).times do 
    Hotel.create(name: Faker::Company.unique.name, location_id: Location.all.sample.id)
end

(50).times do
    Room.create(price: Faker::Number.decimal(l_digits: 2), hotel_id: Hotel.all.sample.id, rating: 0.0)
end
