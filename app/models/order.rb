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

  validates  :domain_id, uniqueness: true

end