class BankDetail < ApplicationRecord
  belongs_to :hotel

  validates :name,:account_holder_name,:account_number,:ifsc, :swft_bc, presence: true
  validates :name, length: { maximum: 255 }
end
