class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build comment_params
    else
      @comment = Comment.new comment_params
    end

    if @comment.save
      respond_to do |format|
        format.js
        format.html{redirect_back fallback_location: root_path}
      end
    end
  end

  def destroy
    @comment.descendants.each do |comment_des|
      comment_des.destroy
    end
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit :post_id, :user_id, :body
  end

  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end
