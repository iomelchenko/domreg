class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  after_commit(on: :create) do ns_balance_initialize end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :address, :city, :state,
                  :postcode, :country_id, :alternative_email, :phone, 
                  :fax, :mobile, :organization

  belongs_to :country
  belongs_to :ns_name
  has_many   :balances
  has_many   :documents
  has_many   :domains
  has_many   :orders

  validates  :first_name, :last_name, :address, :city, :state,
             :postcode, :country_id, :phone, presence: true

  validates  :email, uniqueness: true

  private
 
  def ns_balance_initialize
     @user = User.last
     NsName.create(user_id: @user.id)
     Balance.create(user_id: @user.id)
  end

end


 
