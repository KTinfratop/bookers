class BooksController < ApplicationController
  def new
      @book = Book.new
      @books = Book.all
  end

  def create
    #1データ受け取り
    book = Book.new(book_params)
    #2データベースに保存saveメソッド
    book.save
    #3リダイレクト
    redirect_to '/books'
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
