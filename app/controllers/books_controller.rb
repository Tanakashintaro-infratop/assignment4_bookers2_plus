class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user #userinfo取得用インスタンス
    @book = Book.all
    @newbook = Book.new #Book投稿用インスタンス
    @favorites = Favorite.all #favorite取得用インスタンス
    @new_favorite = Favorite.new #favorite投稿用インスタンス
    @comment = BookComment.all #コメント取得用インスタンス
  end

  def show
    @user = current_user #userinfo取得用インスタンス
    @book = Book.find(params[:id])
    @newbook = Book.new #Book投稿用インスタンス
    @favorites = Favorite.all #favorite取得用インスタンス
    @new_favorite = Favorite.new #favorite投稿用インスタンス
    @comment = BookComment.all #コメント取得用インスタンス
    @newcomment = BookComment.new
  end

  def edit
    if current_user == User.find(params[:id])
      redirect_to books_path
    else
      @book = Book.find(params[:id])
      @newbook = Book.new #Book投稿用インスタンス
    end
  end

  def create
    # if book_params.present?
    newbook = Book.new(book_params)
    newbook.user_id = current_user.id
    if newbook.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(newbook.id)
    else
      @user = current_user #userinfo取得用インスタンス
      @book = Book.all
      @newbook = newbook
      @favorites = Favorite.all #favorite取得用インスタンス
      @new_favorite = Favorite.new #favorite投稿用インスタンス
      @comment = BookComment.all #コメント取得用インスタンス
      render :index
      # redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]= "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      # @newbook = Book.new
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end

end
