class OrderAddMailField < ActiveRecord::Migration
  def change
  	add_column :orders, :email, :string, :null => false
  end
end  
