class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.date :applied_at
      t.decimal :coupon_amount, default: 0

      t.timestamps
    end
  end
end
