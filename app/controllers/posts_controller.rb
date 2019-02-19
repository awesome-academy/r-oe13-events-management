class PostsController < ApplicationController
  before_action :load_posts, only: :show
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
   end

  private

  def load_posts
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t ".no_post"
    redirect_to posts_path
  end
end
