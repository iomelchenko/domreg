class Document < ActiveRecord::Base

  attr_accessible :user_id, :order_id, :invoice_id, :amount

  belongs_to      :user

end