class ChangeTransactionTypeToBeIntegerInWalletHistory < ActiveRecord::Migration[5.1]
  def change
    change_column :wallet_histories, :transaction_type, 'integer USING CAST(transaction_type AS integer)'
  end
end
