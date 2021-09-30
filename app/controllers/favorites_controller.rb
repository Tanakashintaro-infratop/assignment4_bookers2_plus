class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.book_id = params[:book_id]
    favorite.good = true
    favorite.save
    if params[:from] == "books"
      redirect_to books_path
    else
      redirect_to book_path(params[:book_id])
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    if params[:from] == "books"
      redirect_to books_path
    else
      redirect_to book_path(favorite.book_id)
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:book_id)
  end
end
