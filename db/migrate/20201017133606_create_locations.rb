class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :number_of_visits
      t.float :rating
      t.string :image
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
