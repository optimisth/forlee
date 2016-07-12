class HomeController < ApplicationController

  def list
    @list = List.find_by("title=?", params[:list_title])
    @bulletins = @list.bulletins
    post_ids = []
    @bulletins.each do |b|
      b_post_ids = b.posts.map(&:id)
      post_ids.push(b_post_ids)
    end
    @posts = Post.where(id: post_ids)
    @selected = "l#{@list.id}"

    @is_random = false

    render 'index'
  end

  def bulletin
    @list = List.find_by("title=?", params[:list_title])
    @bulletin = @list.bulletins.find_by("title=?", params[:bulletin_title])
    @posts = @bulletin.posts
    post_ids = @posts.map(&:id)
    @pictures = PostAttachment.where(post_id: post_ids)
    @selected = "b#{@bulletin.id}"

    @is_random = false
    render 'index'
  end

  def post
    @list = List.find_by("title=?", params[:list_title])
    @bulletin = @list.bulletins.find_by("title=?", params[:bulletin_title])
    @post = @bulletin.posts.find(params[:id])
    @pictures = @post.post_attachments
    @videos = @post.videos
    @selected = "b#{@post.bulletin.id}"

    @post_next = @post.next
    @post_prev = @post.prev

    @is_random = false
  end

  def index
    @posts = Post.where("id is not 48").order("RANDOM()")
    @is_random = true
    render 'random'
  end

  def about
    @about = About.order('created_at DESC').first

    @is_random = false
  end
end
