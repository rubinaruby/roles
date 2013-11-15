class TeamLeadersController < ApplicationController
  before_action :set_team_leader, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only:[:index, :create]
  
  # GET /team_leaders
  # GET /team_leaders.json
  def index
    @team_leaders = @client.team_leaders
     respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /team_leaders/1
  # GET /team_leaders/1.json
  def show
     respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /team_leaders/new
  def new
    @team_leader = TeamLeader.new
    @team_leader.build_user
     respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /team_leaders/1/edit
  def edit
     respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /team_leaders
  # POST /team_leaders.json
  def create
    @team_leader = @client.team_leaders.create(team_leader_params)
    @success = @team_leader.save

    respond_to do |format|
      if @success
        format.html { redirect_to @team_leader, notice: 'Team leader was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team_leader }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @team_leader.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /team_leaders/1
  # PATCH/PUT /team_leaders/1.json
  def update
    @success=@team_leader.update(team_leader_params)
    respond_to do |format|
      if @success
        format.html { redirect_to @team_leader, notice: 'Team leader was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @team_leader.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /team_leaders/1
  # DELETE /team_leaders/1.json
  def destroy
    @team_leader.destroy
    respond_to do |format|
      format.html { redirect_to team_leaders_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_leader
      @team_leader = TeamLeader.find(params[:id])
    end
    
    def set_client
      @client = Client.find(current_user.role_id)
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_leader_params
      params.require(:team_leader).permit!
    end
end
