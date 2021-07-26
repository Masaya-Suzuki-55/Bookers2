class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book,only: [:edit,:update]
  
  # 投稿一覧画面
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
     
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
    @book = Book.find(params[:id])
  if current_user != @book.user
    redirect_to books_path
  end
  end

  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = 'You have updated book successfully.'
  else
    render :edit
  end
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to "/books"
  end
  
    def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
   
    end
  

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to user_path
    end
  end
end
