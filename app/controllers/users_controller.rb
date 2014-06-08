class UsersController < ApplicationController



  # GET /users
  # GET /users.json
  def index
    @user     = User.where(email: current_user.email)
    
    @domains  = Domain.where(user_id: current_user.id)

    @ns_names = NsName.where(user_id: current_user.id)

    @balance = Balance.where(user_id: current_user.id).order(:created_at)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end

end