# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name_author, :comment_body))
    redirect_to post_path(@post)
end

  def destroy; end
end
