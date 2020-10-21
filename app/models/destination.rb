class Destination < ApplicationRecord
    has_many :trips
    has_many :hotels
    has_many :travelers, through: :trips
    has_many :locations, through: :trips
end
