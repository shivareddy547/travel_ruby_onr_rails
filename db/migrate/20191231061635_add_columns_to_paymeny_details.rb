class AddColumnsToPaymenyDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :payment_details, :card_type, :string
  end
end
