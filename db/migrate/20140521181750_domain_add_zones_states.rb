class DomainAddZonesStates < ActiveRecord::Migration
  def change
  	add_column :domains, :domain_zone_id, :integer
  	add_column :domains, :domain_state_id, :integer 	
    add_column :domains, :user_id, :integer  	
  end
end  
