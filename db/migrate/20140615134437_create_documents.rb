class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :invoice_id
      t.decimal :amount,           :precision => 8, :scale => 2
      t.timestamps
    end
  end
end  