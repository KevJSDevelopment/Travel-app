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
    "https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fd%2Fdd%2FPortland_twighlight.jpg%2F1000px-Portland_twighlight.jpg&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPortland%2C_Maine&tbnid=hfk1YsFZpRvV2M&vet=12ahUKEwiyiOL26LvsAhVuiOAKHRs3DMgQMygAegUIARDOAQ..i&docid=RXfvUD7g7e54KM&w=1000&h=374&q=Portland%20maine&ved=2ahUKEwiyiOL26LvsAhVuiOAKHRs3DMgQMygAegUIARDOAQ",
    "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.aarp.net%2Fcontent%2Fdam%2Faarp%2Ftravel%2Fdestination-guides%2F2018%2F03%2F1140-trv-dst-dc-main.imgcache.revd66f01d4a19adcecdb09fdacd4471fa8.web.650.370.jpg&imgrefurl=https%3A%2F%2Fwww.aarp.org%2Ftravel%2Fdestinations%2Funited-states%2Fwashington-dc%2F&tbnid=La3tIf-KuwqFDM&vet=12ahUKEwi0kr7b6bvsAhVBjeAKHXWzBVgQMygHegUIARDeAQ..i&docid=t9Ao_oPccgBv8M&w=650&h=371&q=washington%20dc&ved=2ahUKEwi0kr7b6bvsAhVBjeAKHXWzBVgQMygHegUIARDeAQ",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DKVadx7xtSek&psig=AOvVaw1BGkAytQrU3baHuZ31j93l&ust=1603030840487000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKiTmsnpu-wCFQAAAAAdAAAAABAD",
    "https://www.google.com/imgres?imgurl=https%3A%2F%2Fpreviews.123rf.com%2Fimages%2Faquamarine4%2Faquamarine41702%2Faquamarine4170200045%2F72453454-woman-hiking-in-rocky-mountains-national-park-denver-colorado-united-states-.jpg&imgrefurl=https%3A%2F%2Fwww.123rf.com%2Fphoto_72453454_woman-hiking-in-rocky-mountains-national-park-denver-colorado-united-states-.html&tbnid=8Jt8QC84k7YxVM&vet=12ahUKEwjcs4mL6rvsAhVPGt8KHXRCCrkQMygRegUIARDmAQ..i&docid=SiGAAHEeIoSYuM&w=1300&h=866&q=denver%20colorado%20mountains&ved=2ahUKEwjcs4mL6rvsAhVPGt8KHXRCCrkQMygRegUIARDmAQ",
    "https://www.google.com/imgres?imgurl=https%3A%2F%2Fsilversea-h.assetsadobe2.com%2Fis%2Fimage%2Fcontent%2Fdam%2Fsilversea-com%2Fports%2Fs%2Fsan-francisco-california%2Fsilversea-caribbean-cruise-san-francisco-california-usa.jpg%3Fwid%3D1200%26hei%3D1200%26fit%3Dconstrain&imgrefurl=https%3A%2F%2Fwww.silversea.com%2Fcruise-to%2Fsan-francisco-california.html&tbnid=cUjPCoSMAnc5uM&vet=12ahUKEwjg4tyk6rvsAhXLAN8KHRJCDnMQMygEegUIARCvAQ..i&docid=XTfdkt6Y6wS0OM&w=1200&h=801&q=sanfrancisco%20california&ved=2ahUKEwjg4tyk6rvsAhXLAN8KHRJCDnMQMygEegUIARCvAQ"
]
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

locations.each do |location|
    iterator = 0
    Location.create(name: location, number_of_visits: 0, rating: 0.0, image: images[iterator], longitude: longitude[iterator], latitude: latitude[iterator])
    iterator += 1
end

(25).times do 
    Hotel.create(name: Faker::Company.unique.name, location_id: Location.all.sample.id)
end

(50).times do
    Room.create(price: Faker::Number.decimal(l_digits: 2), hotel_id: Hotel.all.sample.id, rating: 0.0)
end
