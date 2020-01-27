class ChangeDatatypesOfEnumsInRoomTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :room_types, :room_size, 'integer USING CAST(room_size AS integer)'
    change_column :room_types, :bathroom_size, 'integer USING CAST(bathroom_size AS integer)'
    change_column :room_types, :bed_size, 'integer USING CAST(bed_size AS integer)'
  end
end
