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
    redirect_to book_path(book.id)
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
