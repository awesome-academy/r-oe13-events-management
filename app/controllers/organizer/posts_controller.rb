class Organizer::PostsController < Organizer::BaseController
  before_action :load_events, only: %i(new create edit)
  before_action :load_posts, only: %i(edit update destroy)

  def index
    @posts = Post.select_posts.order_by.page(params[:page]).per Settings.post_page
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = ".create_success"
      redirect_to organizer_posts_path
    else
      flash[:danger] = ".create_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @post.update post_params
      flash[:success] = t ".update_cuccess"
      redirect_to organizer_posts_path
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end
    respond_to do |format|
      format.js
      format.html {redirect_to organizer_posts_path}
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :body, :thumbnail, :event_id
  end

  def load_posts
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t ".no_post"
    redirect_to organizer_posts_path
  end

  def load_events
    @events = Event.select_events
  end
end
