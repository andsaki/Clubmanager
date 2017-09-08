class PostsController < ApplicationController
  #ログイン者のみ表示
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(updated_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    #render plain: params[:post].inspect
    #@post = Post.new(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params)
    @post.username = current_user.username
    if @post.save
      redirect_to posts_path
    else
      #render plain: @post.errors.inspect
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
