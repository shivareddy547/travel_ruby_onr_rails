class AddRatingsToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :map_url, :string
    add_column :hotels, :rating, :string
  end
end
