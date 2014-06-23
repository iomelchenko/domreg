class DomainState < ActiveRecord::Base
  attr_accessible :state_name
  has_many        :domains

  validates  :state_name, presence: true

end