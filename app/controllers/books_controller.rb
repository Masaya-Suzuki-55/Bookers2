class BooksController < ApplicationController
  before_action :authenticate_user!
  
  
  # 投稿一覧画面
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.new
    @books = Book.all
    @new_book = Book.find(params[:id])
    @user = User.find(@new_book.user.id)
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
       @user = User.find(current_user.id)
       @books = Book.all
      render :index
    end
  end

  
  def edit
    
  end
  
  def update
   
  end
  
  
  def destroy
   

  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
