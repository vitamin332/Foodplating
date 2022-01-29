class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path, alert: '不正なアクセスです。' if @post.user != current_user
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def search
    @posts = Post.all
    if params[:cooking_title].present?
      @posts = Post.where('post LIKE ?', "%#{params[:cooking_title]}%")
    else
      @posts = Post.none
    end
  end

  private

  def post_params
    params.require(:post).permit(:cooking_title, :image, :caption)
  end
end
