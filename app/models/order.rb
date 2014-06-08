class Order < ActiveRecord::Base
  attr_accessible :domain_id, :user_id, :organization,
                  :first_name, :last_name, :address, :city,
                  :state, :postcode, :country_id, :alternative_email,
                  :phone, :fax, :mobile, :price, :email

  has_many        :domains  
  belongs_to      :user

  validates  :domain_id, :user_id, :first_name, :last_name, 
             :address, :city, :state, :postcode, :country_id, 
             :phone, :price, :email, presence: true  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      :message => "Email address in not correct"             
end