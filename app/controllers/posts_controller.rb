class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(id: :desc).page(params[:page]).per(10)
    @comment = current_user.comments.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:warning] = "投稿に成功しました"
      redirect_to post_url(@post)
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:warning] = "投稿を削除しました"
    redirect_to user_url(current_user)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content,:img)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end  
  
end
