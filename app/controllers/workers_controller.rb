class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :create, :edit]
  # GET /workers
  # GET /workers.json
  def index
    @client_workers = @user.workers
    @team_leaders = @user.team_leaders
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /workers/new
  def new
    @worker = Worker.new
    @worker.build_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /workers/1/edit
  def edit
    @services = @user.services
    p "****#{@services.count}*******"
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = @user.workers.create(worker_params)
    @success = @worker.save
    respond_to do |format|
      if @success
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @worker }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    @success=@worker.update(worker_params)
    respond_to do |format|
      if @success
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end
    
    def set_user
      if current_user.role_type == "Client"
        @user = Client.find(current_user.role_id)
      elsif current_user.role_type == "TeamLeader"
        @user = TeamLeader.find(current_user.role_id)
      else
        "ID not found"
      end    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit!
    end
end
