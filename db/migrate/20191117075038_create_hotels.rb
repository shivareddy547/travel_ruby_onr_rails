class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :images
      t.string :far_from_mrt
      t.string :far_from_airport
      t.string :far_from_busstand
      t.string :star
      t.string :no_of_rooms
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
