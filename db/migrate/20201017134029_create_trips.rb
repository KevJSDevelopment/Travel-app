class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :status
      t.float :price
      t.integer :user_id
      t.integer :location_id
      t.integer :room_id

      t.timestamps
    end
  end
end
