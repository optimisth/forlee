class HomeController < ApplicationController
  def index
  end

  def list
    @list = List.find_by("title=?", params[:title])
    @bulletins = @list.bulletins
    post_ids = []
    @bulletins.each do |b|
      b_post_ids = b.posts.map(&:id)
      post_ids.push(b_post_ids)
    end
    @posts = Post.where(id: post_ids)
    @selected = "l#{@list.id}"

    render 'index'
  end

  def bulletin
    @bulletin = Bulletin.find_by("title=?", params[:title])
    @list = @bulletin.list
    @posts = @bulletin.posts
    post_ids = @posts.map(&:id)
    @pictures = PostAttachment.where(post_id: post_ids)
    @selected = "b#{@bulletin.id}"

    render 'index'
  end

  def post
    @post = Post.find(params[:id])
    @pictures = @post.post_attachments
    @videos = @post.videos
    @selected = "b#{@post.bulletin.id}"

  end

  def index
    @posts = Post.all
  end
end
