class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :user
      t.string :bank_account
      t.string :bank_account_no
      t.string :bank_type
      t.string :bank_phone
      t.string :account_type
      t.string :paypassword_digest
      t.string :area
      t.integer :balance

      t.timestamps null: false
    end
  end
end
