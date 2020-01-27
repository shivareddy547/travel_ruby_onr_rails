class AddFieldsToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :check_in, :time
    add_column :hotels, :check_out, :time
    add_column :hotels, :terms_and_conditions, :string
  end
end
