class UsersController < ApplicationController

  before_action :authenticate_user!
  # before_action :ensure_correct_user, only:[:edit]

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @users = User.all
    @book = Book.new
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

  # def logout
  #   session[:user_id] = nil
  #   flash[:notice] = "Signed out successfully."
  #   redirect_to root_path
  # end

   private

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
