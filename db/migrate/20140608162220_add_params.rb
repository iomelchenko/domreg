class AddParams < ActiveRecord::Migration
  def change
    create_table :params do |t|
      t.string :params
      t.string  :values
      t.timestamps
    end
  end  
end
