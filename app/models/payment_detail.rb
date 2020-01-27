class PaymentDetail < ApplicationRecord
  validates :price, presence: true
end
