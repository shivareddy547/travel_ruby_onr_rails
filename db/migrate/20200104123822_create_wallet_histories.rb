class CreateWalletHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :wallet_histories do |t|
      t.integer :user_id
      t.decimal :previous_amount, default: 0
      t.decimal :current_amount, default: 0
      t.boolean :transaction_type
      t.date :transaction_date
      t.string :transaction_code

      t.timestamps
    end
  end
end
