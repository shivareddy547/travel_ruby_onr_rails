class CreateRoomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :room_types do |t|
      t.string :name
      t.string :description
      t.boolean :include_breakfast, default: false
      t.boolean :is_active, default: true
      t.string :room_size
      t.string :bathroom_size
      t.string :bed_size
      t.string :no_of_adult
      t.string :no_of_child
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
