class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :real_name
      t.string :user_type
      t.string :phone
      t.string :email
      t.string :idcard
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
