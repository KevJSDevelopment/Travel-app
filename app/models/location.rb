class Location < ApplicationRecord
    has_many :trips
    has_many :hotels
    has_many :travelers, through: :trips
end
