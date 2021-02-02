class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  def favorited_book_list
    @user = User.find(params[:id])
    @favorited_books = @user.favorited_books
  end
  
  def favorited_comment_list
    @user = User.find(params[:id])
    @favorited_comments = @user.favorited_comments
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
