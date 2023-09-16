class BooksController < ApplicationController
  def new
      @book = Book.new
  end

  def create
  # 1 データ受け取り
    @book = Book.new(book_params) # インスタンス変数として新しい Book インスタンスを作成

  # 2 データベースに保存
    if @book.save # インスタンス変数 @book を使用して保存を試みる
    # 3 フラッシュメッセージとリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(book.id)
    else
        @books = Book.all
        render :edit
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
