class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books if @user.present?
  end

  def edit
     @user = current_user
  end
  
  def index
     @users = User.all
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'User info was successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
