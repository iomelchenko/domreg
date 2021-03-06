class OrdersController < ApplicationController

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @domain = Domain.find(@order.domain_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @user_info = User.find(current_user)

    @domain = Domain.find_by_id(params[:domain_id])
    @domain ||= Domain.find_by_id(session[:domain_id])    

    @order.first_name        = @user_info.first_name
    @order.last_name         = @user_info.last_name
    @order.organization      = @user_info.organization
    @order.address           = @user_info.address
    @order.city              = @user_info.city
    @order.state             = @user_info.state
    @order.postcode          = @user_info.email
    @order.alternative_email = @user_info.alternative_email
    @order.phone             = @user_info.phone
    @order.fax               = @user_info.fax
    @order.mobile            = @user_info.mobile
    @order.email             = @user_info.email
    @order.user_id           = @user_info.id
    @order.domain_id         = @domain.id
    @order.country_id        = @user_info.country_id
    @order.price             = @domain.domain_zone.price

    session[:domain_id] = @domain.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @domain = Domain.find(session[:domain_id])
    @balance = Balance.where(user_id: @order.user_id).last
    rest_amount = @balance.check_balance(@order.price, @order.user_id)
    current_amount = @balance.amount

    if rest_amount != -1
      respond_to do |format|
        if @order.save
          state_id = DomainState.where(state_name: 'in progress')[0].id
          @domain.update_attribute(:domain_state_id, state_id)
          @balance_new = Balance.new(user_id: @order.user_id, amount: current_amount - @order.price)
          @balance_new.save
          @document_new = Document.new(user_id: @order.user_id, order_id: Order.last.id, amount: -@order.price)
          @document_new.save
          format.html { redirect_to domains_path, notice: 'Order was successfully created.' }
          format.json { render json: @order, status: :created, location: @order }
        else
          format.html { render action: "new" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    
    else
    
      redirect_to new_order_path(@order), notice: 'Balance is too small for order.'

    end    
  end


end