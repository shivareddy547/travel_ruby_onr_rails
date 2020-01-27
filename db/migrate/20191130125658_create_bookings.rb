class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|

      t.string :status
      t.datetime :check_in
      t.datetime :check_out
      t.references :user, foreign_key: true
      t.references :hotel, foreign_key: true
      t.references :room_type, foreign_key: true

      t.timestamps
    end
  end
end
