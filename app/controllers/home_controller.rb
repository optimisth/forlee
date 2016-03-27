class HomeController < ApplicationController
  def index
  end

  def bulletin
    @bulletin = Bulletin.find_by("title=?", params[:title])
    @list = @bulletin.list
    @posts = @bulletin.posts
    post_ids = @posts.map(&:id)
    @pictures = PostAttachment.where(post_id: post_ids)
  end

  def post
    @post = Post.find(params[:id])
  end

  def index
  end
end
