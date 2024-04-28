class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user = current_user # 現在のユーザーを書籍の所有者として設定する

    if @book.save
      redirect_to book_path(@book), notice: 'You have created book successfully.' # 保存に成功した場合のリダイレクト先とメッセージ
    else
      render :new
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
  
  def destroy
    @book = Book.find(params[:id]) # 削除するPostImageレコードを取得
    @book.destroy # レコードを削除
    redirect_to books_path # PostImageの一覧ページへのパス
  end 
  
  
  # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body) # 許可するパラメーターを指定する
  end
end
