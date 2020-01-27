class ChangeDatatypesOfEnumsInHotels < ActiveRecord::Migration[5.1]
  def change
    change_column :hotels, :star, 'integer USING CAST(star AS integer)'
    change_column :hotels, :far_from_mrt, 'integer USING CAST(far_from_mrt AS integer)'
    change_column :hotels, :far_from_airport, 'integer USING CAST(far_from_airport AS integer)'
    change_column :hotels, :far_from_busstand, 'integer USING CAST(far_from_busstand AS integer)'
  end
end
