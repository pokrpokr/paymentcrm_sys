class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :order_info
      t.string :order_status
      t.string :order_sum

      t.timestamps null: false
    end
  end
end
