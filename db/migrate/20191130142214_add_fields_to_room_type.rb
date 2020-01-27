class AddFieldsToRoomType < ActiveRecord::Migration[5.1]
  def change
    add_column :room_types, :price, :integer
    add_column :room_types, :infant_age_limit, :integer
    add_column :room_types, :capacity, :integer
    add_column :room_types, :availability_units, :integer
  end
end
