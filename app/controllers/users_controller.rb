class UsersController < ApplicationController
  def show
    @users = User.all
    @book = Book.new
    @user = current_user
    @user1 = User.find(params[:id])
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to "/users/#{@user.id}"
    else
      render:edit
    end
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    
    @user = User.find(params[:id])
  end
  
  def nill
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
