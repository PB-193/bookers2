class BooksController < ApplicationController
  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @users = @book.users

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
  end

  def update
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "create successfully"
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
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
  
end
