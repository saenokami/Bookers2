class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new' 
    end
  end

  def index
    @books = Book.all
    @user_info = current_user # ログインしているユーザーの情報
    @new_book = Book.new # 新しい書籍を作成するための空のBookインスタンス
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
