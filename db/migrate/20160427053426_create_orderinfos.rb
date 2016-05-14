class CreateOrderinfos < ActiveRecord::Migration
  def change
    create_table :orderinfos do |t|
      t.belongs_to :order
      t.string :buyer_account
      t.string :seller_account
      t.string :product_info

      t.timestamps null: false
    end
  end
end
