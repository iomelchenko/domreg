class Domain < ActiveRecord::Base
  attr_accessible :name, :domain_zone_id, :domain_state_id, :user_id

  belongs_to      :user
  belongs_to      :domain_zone
  belongs_to      :domain_state
  belongs_to      :order


  validates  :name, :domain_zone_id, presence: true  
end
