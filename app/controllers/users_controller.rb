class UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books if @user.present?
  end

  def edit
     @user = User.find(params[:id])
     if current_user != @user
       flash[:error] = "他人のユーザ情報を編集することはできません。"
       redirect_to root_path
     end
  end
  
  def index
     @users = User.all
  end
  
  def update
    @user = current_user
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