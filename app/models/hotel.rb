class Hotel < ApplicationRecord
    belongs_to :location
    has_many :rooms
end
