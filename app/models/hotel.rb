class Hotel < ApplicationRecord
    belongs_to :destination
    has_many :rooms
end
