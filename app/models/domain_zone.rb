class DomainZone < ActiveRecord::Base
  attr_accessible :zone_name
  has_many        :domains  
end
