class OrderRemoveZonenameField < ActiveRecord::Migration
  def change
  	remove_column :orders, :zone_name
  end
end  
