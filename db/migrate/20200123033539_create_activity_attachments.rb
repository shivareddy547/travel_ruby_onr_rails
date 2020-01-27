class CreateActivityAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_attachments do |t|
      t.integer :activity_id
      t.string :avatar

      t.timestamps
    end
  end
end
