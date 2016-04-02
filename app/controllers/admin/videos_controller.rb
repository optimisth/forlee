class Admin::VideosController < ApplicationController
  before_action :set_list
  before_action :set_bulletin
  before_action :set_post
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "secret"

  layout 'admin'

  # GET /videos
  # GET /videos.json
  def index
    @videos = @post.videos.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = @post.videos.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = @post.videos.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to [:admin, @list, @bulletin, @post, @video], notice: 'Video was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to [:admin, @list, @bulletin, @post, @video], notice: 'Video was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to admin_list_bulletin_post_videos_url, notice: 'Video was successfully destroyed.' }
    end
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_bulletin
      @bulletin = @list.bulletins.find(params[:bulletin_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @bulletin.posts.find(params[:post_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = @post.videos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:video_url)
    end
end
