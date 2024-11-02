class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
     @posts = Post.includes(:user).all.order(created_at: :desc)
  end

  def new
     @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.user =  Current.user
      if @post.save
        redirect_to @post
      else
        render :new, status: :unprocessable_entity
      end
    rescue ActiveRecord::ActiveRecordError => error
      logger.error("Failed to save record, error: #{error}")
      render :new, status: :unprocessable_entity
  end

  def show
      @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    rescue ActiveRecord::ActiveRecordError => error
    logger.error("Failed to destroy record, error: #{error}")
    redirect_to @post, status: :unprocessable_entity
  end

  private

  def post_params
      params.require(:post).permit(:title, :content)
  end
end
