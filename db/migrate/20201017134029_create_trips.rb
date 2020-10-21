class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :status
      t.float :travel_price
      t.float :room_price
      t.integer :traveler_id
      t.integer :location_id
      t.integer :destination_id
      t.integer :room_id
      t.string :date_from
      t.string :date_to

      t.timestamps
    end
  end
end
