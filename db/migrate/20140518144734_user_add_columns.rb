class UserAddColumns < ActiveRecord::Migration
  def change
  	add_column :users, :organization, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :address, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :postcode, :string
  	add_column :users, :country_id, :integer
  	add_column :users, :alternative_email, :string
  	add_column :users, :phone, :string
  	add_column :users, :fax, :string
  	add_column :users, :mobile, :string
  	  	  	  	  	  	  	  	  	  	  	  	
  end
end  

