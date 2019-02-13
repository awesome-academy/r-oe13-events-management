class Organizer::PostsController < Organizer::BaseController
  before_action :load_events, only: %i(new create)
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
      redirect_to posts_path
    else
      flash[:danger] = ".create_fail"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :body, :event_id
  end

  def load_events
    @events = Event.select_events
  end
end
