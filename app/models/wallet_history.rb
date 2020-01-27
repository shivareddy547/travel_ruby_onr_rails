class WalletHistory < ApplicationRecord
  belongs_to :user
  enum transaction_type: [:debit, :credit]
end
