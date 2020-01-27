class AddFieldsToFacility < ActiveRecord::Migration[5.1]
  def change
    add_column :facilities, :images, :string
    add_column :facilities, :price, :integer
  end
end
