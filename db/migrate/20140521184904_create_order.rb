class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :domain_id
      t.integer :user_id
      t.string  :zone_name
  	  t.string  :organization
  	  t.string  :first_name
  	  t.string  :last_name
  	  t.string  :address
  	  t.string  :city
  	  t.string  :state
  	  t.string  :postcode
  	  t.integer :country_id
  	  t.string  :alternative_email
  	  t.string  :phone
  	  t.string  :fax
  	  t.string  :mobile     
  	  t.decimal :price,           :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
