class AddLocationFieldToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :hotels, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
