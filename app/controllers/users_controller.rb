class UsersController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
    @books = Book.all

  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
  end

  def update
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end