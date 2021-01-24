class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to request.referer
    end
  end

  def destroy
    if Comment.find(params[:id]).destroy
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(book_id: params[:book_id])
  end

end
