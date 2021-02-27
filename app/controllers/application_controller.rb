class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  # def show
  #   @user = User.find(params[:id])
  #   @book = Book.new
  #   @books = @user.books
  # end

  # def new
  #   @book = Book.new
  # end

  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = current_user.id
  #   if @book.save
  #     redirect_to book_path(@book)
  #   else
  #     render :index
  #   end
  # end

  # def index
  #   @users = User.all
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user = current_user
  #   if @user.update(user_params)
  #     flash[:notice] = "You have updated user succeessfully."
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :introduction, :profile_image_id)
  # end

end
