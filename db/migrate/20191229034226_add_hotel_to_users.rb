class AddHotelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :hotel, foreign_key: true, index: true
  end
end
