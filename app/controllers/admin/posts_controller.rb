class Admin::PostsController < ApplicationController
  before_action :set_list
  before_action :set_bulletin
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "secret"


  # GET /posts
  # GET /posts.json
  def index
    @posts = @bulletin.posts.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_attachments  = @post.post_attachments.all
  end

  # GET /posts/new
  def new
    @post = @bulletin.posts.new
    @post_attachment = @post.post_attachments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @bulletin.posts.new(post_params)

    respond_to do |format|
      if @post.save
        params[:post_attachments]['avatar'].each do |a|
          @post_attachment = @post.post_attachments.create!(:avatar => a)
        end
        format.html { redirect_to [:admin, @list, @bulletin, @post], notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [:admin, @list, @bulletin, @post], notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_list_bulletin_posts_url, notice: 'Post was successfully destroyed.' }
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
      @post = @bulletin.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :content, post_attachments_attirbutes: [:id, :post_id, :avatar])
    end
end
