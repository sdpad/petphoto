class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page]).per(12)
    end
  end
end
