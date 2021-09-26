class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user #userinfo取得用インスタンス
    @newbook = Book.new #Book投稿用インスタンス
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where('user_id': params[:id])
    @newbook = Book.new #Book投稿用インスタンス
  end

  def edit
    if current_user != User.find(params[:id])
      redirect_to user_path(current_user.id)
    end
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else

      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
