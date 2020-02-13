# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit; end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was deleted.' }
      format.json { head :no_content }
    end
    end

  private

  def post_params
    params.require(:post).permit(:title, :content, :picture)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
