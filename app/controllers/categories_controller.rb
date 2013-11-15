class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:index, :create]
  # GET /categories
  # GET /categories.json
  def index
    @categories = @client.categories
     respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
     respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
     respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /categories/1/edit
  def edit
     respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @client.categories.create(category_params)
    @success=@category.save
    respond_to do |format|
      if @success
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @success=@category.update(category_params)
    respond_to do |format|
      if @success
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
    
    def set_client
      @client = Client.find(current_user.role_id)
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
