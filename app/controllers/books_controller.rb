class BooksController < ApplicationController
  def show
  end

  def index
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
  end
end
