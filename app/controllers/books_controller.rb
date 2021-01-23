class BooksController < ApplicationController
  
  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to root_path
    end
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
