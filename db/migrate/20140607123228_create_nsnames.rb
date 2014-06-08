class CreateNsnames < ActiveRecord::Migration
  def change
    create_table :ns_names, :id => false do |t|
      t.integer :user_id
      t.string  :ns1
      t.string  :ns2      
      t.timestamps
    end
  end
end
