class Trip < ApplicationRecord
    belongs_to :traveler
    belongs_to :location
    belongs_to :destination
    belongs_to :room
end
