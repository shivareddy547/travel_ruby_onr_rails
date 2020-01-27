class CreateRestaurantAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurant_attachments do |t|
      t.integer :restaurant_id
      t.string :avatar

      t.timestamps
    end
  end
end
