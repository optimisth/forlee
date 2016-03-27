class Admin::BulletinsController < ApplicationController
  before_action :set_list
  before_action :set_bulletin, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "secret"

  # GET /bulletins
  # GET /bulletins.json
  def index
    @bulletins = @list.bulletins.all
  end

  # GET /bulletins/1
  # GET /bulletins/1.json
  def show
  end

  # GET /bulletins/new
  def new
    @bulletin = @list.bulletins.new
  end

  # GET /bulletins/1/edit
  def edit
  end

  # POST /bulletins
  # POST /bulletins.json
  def create
    @bulletin = @list.bulletins.new(bulletin_params)

    respond_to do |format|
      if @bulletin.save
        format.html { redirect_to [:admin, @list, @bulletin], notice: 'Bulletin was successfully created.' }

      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /bulletins/1
  # PATCH/PUT /bulletins/1.json
  def update
    respond_to do |format|
      if @bulletin.update(bulletin_params)
        format.html { redirect_to [:admin, @list, @bulletin], notice: 'Bulletin was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /bulletins/1
  # DELETE /bulletins/1.json
  def destroy
    @bulletin.destroy
    respond_to do |format|
      format.html { redirect_to admin_list_bulletins_url, notice: 'Bulletin was successfully destroyed.' }
    end
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      @bulletin = @list.bulletins.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulletin_params
      params.require(:bulletin).permit(:list_id, :title, :description)
    end
end
