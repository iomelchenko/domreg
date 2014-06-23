class DomainZone < ActiveRecord::Base
  attr_accessible :zone_name, :price
  has_many        :domains  

  validates  :zone_name, :price, presence: true 

end
