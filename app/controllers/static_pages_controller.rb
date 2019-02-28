class StaticPagesController < ApplicationController
  def home
    @events = Event.event_index.order_desc.limit Settings.limit_event_new
    @posts_new = Post.select_posts.order_by.limit(4)
    @posts_old = Post.select_posts.order(created_at: :asc).limit(6)
  end
end
