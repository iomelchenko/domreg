class AddPriseToDomaineZone < ActiveRecord::Migration
  def change
  	add_column :domain_zones, :price, :decimal, :precision => 8, :scale => 2
  end
end  

