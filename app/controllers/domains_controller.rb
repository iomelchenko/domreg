class DomainsController < ApplicationController

require 'net/http'

  # GET /domains
  # GET /domains.json
  def index

    @domains = Domain.where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @domains }
    end
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @domain = Domain.find(params[:id])
    session[:domain_id] = @domain.id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @domain }
    end
  end

  # GET /domains/new
  # GET /domains/new.json
  def new
    @domain = Domain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(params[:domain])
    @domain.user_id = current_user.id
    @domain.domain_state_id = DomainState.where(state_name: 'checked')[0].id
    dom_zone_name = @domain.domain_zone.zone_name if @domain.domain_zone != nil
    dom_zone_name ||= ''
    check_result = check_domain_name(@domain.name + '.' + dom_zone_name)

    respond_to do |format|
     if  dom_search_result(check_result, dom_zone_name) == 'yes' && @domain.save 
         format.html { redirect_to @domain, notice: 'Domain name available for registration.' }
         format.json { render json: @domain, status: :created, location: @domain }
     else
         format.html { render action: "new" }
         format.json { render json: @domain.errors, status: :unprocessable_entity }
     end
    end 
  end

  # PUT /domains/1
  # PUT /domains/1.json
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_attributes(params[:domain])
        format.html { redirect_to @domain, notice: 'Domain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy

    respond_to do |format|
      format.html { render action: "new" }
      format.json { head :no_content }
    end
  end

private

  def check_domain_name(domain_name)
    api_key = Param.find_by_params('dynadot_api_key').values
    uri = URI.parse('https://api.dynadot.com')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    http.start do |http|
      req = Net::HTTP::Get.new("/api2.html?key=#{api_key}&command=search&domain0=#{domain_name}")
      response = http.request(req).body
    end
  end

  def dom_search_result(message, dom_zone_name)
    @domain.errors.add(:domain_zone_id, ["Domain zone does't selected"]) if @domain.domain_zone == nil

    if message == "ok,\n\ndomain0," + @domain.name + "." + dom_zone_name + ",,yes,\n"
      'yes'
    elsif message == "ok,\n\ndomain0," + @domain.name + "." + dom_zone_name + ",,no,\n"
      @domain.errors.add(:name, ["domain name already taken"])
      'no'
    elsif message == "ok,\n\ndomain0," + @domain.name + "." + dom_zone_name + ",,offline,\n"
      @domain.errors.add(:name, ["the central registry for this domain is currently offline"])
      'no'
    elsif message == "ok,\n\ndomain0," + @domain.name + "." + dom_zone_name + ",,system_busy,\n"
      @domain.errors.add(:name, ["all connections are busy"])
      'no'
    elsif message == "ok,\n\ndomain0," + @domain.name + "." + dom_zone_name + ",,error,unexpected registry error,\n"
      @domain.errors.add(:name, ["unexpected registry error"])
      'no'
    elsif message == "ok,\n\ndomain0," + @domain.name + "." + dom_zone_name + ",,error,invalid characters in domain\n"  
      @domain.errors.add(:name, ["Invalid characters in domain"])
      'no'
    else
      @domain.errors.add(:name, ["Unexpected error. Check syntax"])
      'no'
    end
  end  
  
end
