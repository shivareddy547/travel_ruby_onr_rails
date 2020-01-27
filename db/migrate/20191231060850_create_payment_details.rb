class CreatePaymentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_details do |t|

      t.string :status, default: 'PENDING'
      t.string :price, :integer

      t.references :hotel, foreign_key: true
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
