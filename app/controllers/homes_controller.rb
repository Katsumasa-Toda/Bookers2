class HomesController < ApplicationController
  def top
  end
  
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end
end
