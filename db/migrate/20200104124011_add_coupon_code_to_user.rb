class AddCouponCodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :coupon_code, :string
    add_column :users, :wallet_amount, :decimal, default: 0
  end
end
