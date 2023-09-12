class BooksController < ApplicationController
  def new
      @book = Book.new
  end

  def create
    #1データ受け取り
    book = Book.new(book_params)
    #2データベースに保存saveメソッド
    book.save
    #3リダイレクト
    redirect_to '/show'
  end
  
  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
