class Country < ActiveRecord::Base
  attr_accessible :name, :name_rus
  has_many        :users
end