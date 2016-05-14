class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|
      t.references :finance, polymorphic: true
      t.integer  :userid
      t.string   :type
      t.integer  :pay_account
      t.string   :to_bank_account
      t.string   :to_bank_account_no
      t.string   :to_bank_type
      t.decimal  :money
      t.integer  :tousername
      t.string   :info
      t.string   :pay_info
      t.datetime :pay_time
      t.datetime :receive_time

      t.timestamps null: false
    end
  end
end
