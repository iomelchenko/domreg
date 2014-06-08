class CreateBalance < ActiveRecord::Migration
  def change
    create_table :balances, :id => false do |t|
      t.integer :user_id
      t.decimal :amount,           :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
