class BooksController < ApplicationController
  def show
    @books = Book.all
    @book = Book.new
    @user = current_user
    @book1 = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "update successfully"
      redirect_to "/books/#{@book.id}"
    else
      render:edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "create successfully"
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      @user = current_user
      render:index
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "destroy successfully"
      redirect_to "/books"
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

aaaaa

end
