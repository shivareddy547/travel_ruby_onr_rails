class CreateNearByActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :near_by_activities do |t|
      t.string :name
      t.string :images
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
