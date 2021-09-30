class BookCommentsController < ApplicationController
  def create
    newcomment = BookComment.new(comment_params)
    # newcomment.user_id = current_user.id
    # newcomment.book_id = params[:book_id]
    newcomment.save
    logger.debug("#######################")
    logger.debug(newcomment.user_id)
    logger.debug(newcomment.book_id)
    logger.debug(newcomment.comment)
    logger.debug("#######################")
    redirect_to book_path(newcomment.book_id)
  end

  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_to book_path(comment.book.id)
  end

  private

  def comment_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end
end
