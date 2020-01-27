class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :attraction_id
      t.string :name
      t.string :short_name
      t.text :description
      t.text :short_description
      t.string :video_url
      t.string :operating_hours
      t.datetime :opening_time
      t.datetime :closing_time
      t.string :location_name
      t.text :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :extra_tips
      t.boolean :is_free
      t.boolean :morning_ok
      t.boolean :afternoon_ok
      t.boolean :evening_ok
      t.boolean :midnight_ok
      t.integer :adult_price
      t.integer :senior_price
      t.integer :child_price
      t.string :city
      t.string :phone_number
      t.string :category_names
    

      t.timestamps
    end
  end
end
