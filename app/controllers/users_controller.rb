class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def edit
     @user = User.find(params[:id])
     if current_user != @user
       flash[:error] = "他人のユーザ情報を編集することはできません。"
       redirect_to user_path(current_user.id)
     end
  end

  def index
     @user = current_user
     @users = User.all
     @new_book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'You have updated user successfully.'
    else

      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end