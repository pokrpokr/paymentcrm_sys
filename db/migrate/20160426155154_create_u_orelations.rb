class CreateUOrelations < ActiveRecord::Migration
  def change
    create_table :u_orelations do |t|
      t.belongs_to :user
      t.belongs_to :order

      t.timestamps null: false
    end
  end
end
