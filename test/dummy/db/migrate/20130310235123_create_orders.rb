class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :payment_type
      t.decimal :total_price

      t.timestamps
    end
  end
end
