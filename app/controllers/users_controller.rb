class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def index
  	@book = Book.new
    @users = User.all
    @user = current_user
    
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book),notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated"
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end
 
  private
    def correct_user
        @user = User.find(params[:id])
        if current_user != @user
        redirect_to user_path(current_user.id)
        end
    end
    
    def user_params
     params.require(:user).permit(:name ,:profile_image,:introduction)
    end
  
  
end