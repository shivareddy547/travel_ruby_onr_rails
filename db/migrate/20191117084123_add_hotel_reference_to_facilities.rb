class AddHotelReferenceToFacilities < ActiveRecord::Migration[5.1]
  def change
    add_reference :facilities, :hotel, foreign_key: true
  end
end
