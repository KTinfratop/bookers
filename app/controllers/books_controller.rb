class BooksController < ApplicationController
  def new
      @book = Book.new
  end

  def create
    #1データ受け取り
    book = Book.new(book_params)
    #2データベースに保存saveメソッド
    if book.save
    #3フラッシュメッセージとリダイレクト
       flash[:notice] = "Book was successfully created."
       redirect_to book_path(book.id)
    else
       @book = Book.all
       @books = Book.all
       render :index
    end
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
    if  book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(book.id)
    else
        @book = Book.all
        @books = Book.all
        render :index
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to index_book_path(book.id)
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
