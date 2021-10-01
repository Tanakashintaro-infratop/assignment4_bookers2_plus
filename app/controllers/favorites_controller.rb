class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save

    if URI(request.referer).path == books_path
      redirect_to books_path
    elsif URI(request.referer).path == user_path(book.user)
      redirect_to user_path(book.user)
    else
      redirect_to book_path(book)
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy

    if URI(request.referer).path == books_path
      redirect_to books_path
    elsif URI(request.referer).path == user_path(book.user)
        redirect_to user_path(book.user)
    else
      redirect_to book_path(book)
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:book_id)
  end
end
