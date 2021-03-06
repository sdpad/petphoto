class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[index show followings followers likes]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(9)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:warning] = 'ユーザを登録しました'
      redirect_to user_url(@user)
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end

  def followings
    user = User.find(params[:id])
    @followings = user.followings.order(id: :desc).page(params[:page]).per(5)
  end

  def followers
    user = User.find(params[:id])
    @followers = user.followers.order(id: :desc).page(params[:page]).per(5)
  end

  def likes
    @user = User.find(params[:id])
    @posts = @user.likes.includes(:user).order(id: :desc).page(params[:page]).per(12)
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
