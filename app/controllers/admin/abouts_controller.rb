class Admin::AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "secret"

  layout 'admin'

  # GET /abouts
  # GET /abouts.json
  def index
    @abouts = About.all
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
  end

  # GET /abouts/new
  def new
    @about = About.new
  end

  # GET /abouts/1/edit
  def edit
  end

  # POST /abouts
  # POST /abouts.json
  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        unless params[:avatar].blank?
          @about.avatar.create!(:avatar => params[:avatar])
        end
        format.html { redirect_to [:admin, @about], notice: 'About was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /abouts/1
  # PATCH/PUT /abouts/1.json
  def update
    respond_to do |format|
      if @about.update(about_params)
        unless params[:avatar].blank?
          @about.avatar.create!(:avatar => params[:avatar])
        end
        format.html { redirect_to [:admin, @about], notice: 'About was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /abouts/1
  # DELETE /abouts/1.json
  def destroy
    @about.destroy
    respond_to do |format|
      format.html { redirect_to admin_abouts_url, notice: 'About was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_params
      params.require(:about).permit(:content, :avatar)
    end
end
