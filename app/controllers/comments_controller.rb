class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:warning] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:warning] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content).merge(params.permit(:post_id))
  end
end
