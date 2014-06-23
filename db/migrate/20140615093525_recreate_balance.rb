class RecreateBalance < ActiveRecord::Migration
  def up
    drop_table :balances

    create_table :balances do |t|
      t.integer :user_id
      t.decimal :amount,           :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def down

    drop_table :balances

    create_table :balances, :id => false do |t|
      t.integer :user_id
      t.decimal :amount,           :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
