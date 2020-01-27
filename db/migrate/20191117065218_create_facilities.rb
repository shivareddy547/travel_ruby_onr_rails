class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :description
      t.boolean :incl_charges, default: false
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
