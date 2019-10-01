# frozen_string_literal: true

# :nodoc:
class CommentsController < ApplicationController
  def index
    @comments = @post.comments.order(created_at: :desc)
  end

  def create
    @comment = Comment.new(permit_comment)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to post_path(@comment.post)
  end

  private

  def permit_comment
    params.require(:comment).permit(:body)
  end
end
