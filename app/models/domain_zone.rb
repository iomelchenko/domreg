class DomainZone < ActiveRecord::Base
  attr_accessible :zone_name, :price
  has_many        :domains  
end
