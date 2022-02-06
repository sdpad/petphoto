class ToppagesController < ApplicationController
  def index
    @posts = current_user.feed_posts.includes(:user).order(id: :desc).page(params[:page]).per(12) if logged_in?
  end
end
