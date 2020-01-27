class ChangeDatatypeOfRoomTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :room_types, :no_of_adult, 'integer USING CAST(no_of_adult AS integer)'
    change_column :room_types, :no_of_child, 'integer USING CAST(no_of_child AS integer)'
  end
end
