class PostsController < ApplicationController

  #ログイン者のみ表示
  before_action :authenticate_user!

  def index
    @posts = Post.search(params[:search]).order(updated_at: 'desc').where("group_id = ?", current_user.state_group_id)
    @tmp = params[:search]
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
    @post.user_id = current_user.id
    @post.group_id = current_user.state_group_id
    #@post.group_id = @group.id
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
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.username != current_user.username then
    else
      @post.destroy
    end
    redirect_to posts_path
  end

  def club_list
  end


  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
