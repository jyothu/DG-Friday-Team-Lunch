class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address_1
      t.string :street_address_2
      t.string :zip
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
