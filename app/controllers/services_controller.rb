class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:show, :create, :index, :new]
  # GET /services
  # GET /services.json
  def index
    @cat = @client.categories
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /services/new
  def new
    @service = @client.services.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /services/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /services
  # POST /services.json
  def create
    @service = @client.services.create(service_params)
    @success=@service.save

    respond_to do |format|
      if @success
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @service }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @success=@service.update(service_params)
    respond_to do |format|
      if @success
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_client
      @client = Client.find(current_user.role_id)
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_name, :price, :description, :client_id, :category_id, :new_category, :id_client)
    end
end
