class CreateBankDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_details do |t|
      t.string :name
      t.string :account_holder_name
      t.string :account_number
      t.string :ifsc
      t.string :swft_bc
      t.string :description
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
