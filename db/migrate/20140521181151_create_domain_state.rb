class CreateDomainState < ActiveRecord::Migration
  def change
    create_table :domain_states do |t|
      t.string :state_name
      t.timestamps
    end
  end
end
