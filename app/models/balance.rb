class Balance < ActiveRecord::Base

  after_initialize :default_amount

  attr_accessible :user_id, :amount

  belongs_to      :user

  private
    def default_amount
      self.amount ||= 0.00
    end
end