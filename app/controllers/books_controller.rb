class BooksController < ApplicationController
  
  
  def index
    @books = Book.all
  end
  
  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to user_path(current_user)
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
