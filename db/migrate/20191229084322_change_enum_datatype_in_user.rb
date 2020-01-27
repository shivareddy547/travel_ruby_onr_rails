class ChangeEnumDatatypeInUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :gender, 'integer USING CAST(gender AS integer)'
  end
end
