class Admin::PostAttachmentsController < ApplicationController
  before_action :set_post_attachment, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /post_attachments
  # GET /post_attachments.json
  def index
    @post_attachments = PostAttachment.all
  end

  # GET /post_attachments/1
  # GET /post_attachments/1.json
  def show
  end

  # GET /post_attachments/new
  def new
    @post_attachment = PostAttachment.new
  end

  # GET /post_attachments/1/edit
  def edit
  end

  # POST /post_attachments
  # POST /post_attachments.json
  def create
    @post_attachment = PostAttachment.new(post_attachment_params)

    respond_to do |format|
      if @post_attachment.save
        format.html { redirect_to admin_post_attachment_path(@post_attachment), notice: 'Post attachment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /post_attachments/1
  # PATCH/PUT /post_attachments/1.json
  def update
    respond_to do |format|
      if @post_attachment.update(post_attachment_params)
        format.html { redirect_to @post_attahcment.post, notice: 'Post attachment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /post_attachments/1
  # DELETE /post_attachments/1.json
  def destroy
    post = @post_attachment.post
    @post_attachment.destroy
    respond_to do |format|
      format.html { redirect_to admin_list_bulletin_post_path(post.bulletin.list, post.bulletin, post), notice: 'Post Attachment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_attachment
      @post_attachment = PostAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_attachment_params
      params.require(:post_attachment).permit(:post_id, :avatar)
    end
end
