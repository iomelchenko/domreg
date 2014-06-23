class Balance < ActiveRecord::Base

  after_initialize :default_amount

  attr_accessible :user_id, :amount

  belongs_to      :user

  def check_balance(price, userid)
    diff = Balance.where(user_id: userid).last.amount - price
  	if diff >= 0 
   		diff
   	else
   	  -1
   	end	
  end 
  
  private
    def default_amount
      self.amount ||= 0.00
    end
    
   
end