class CreateDomainExtention < ActiveRecord::Migration
  def change
    create_table :domain_zones do |t|
      t.string :zone_name
      t.timestamps
    end
  end
end