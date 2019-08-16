# frozen_string_literal: true

class Api::PostsController < ApplicationController
  before_action :authenticate_user, only: %i[create update delete]
  before_action :set_post, only: %i[show update delete]

  def index
    @posts = Post.order('created_at DESC')
    render json: @posts
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    @post = set_post
    render json: { result: true, post: @post }, include: { user: { only: :username } }
   end

  def update
    if current_user
      @post.update(post_param)
      render json: { result: true, post: @post }, status: :created
    else
      render json: { msg: "Yout can't access" }, status: :unprocessable_entity
     end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
