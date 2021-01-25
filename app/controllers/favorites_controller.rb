class FavoritesController < ApplicationController
  
 def create
  if params[:comment_id]
    current_user.favorites.create(comment_id: params[:comment_id])
  elsif params[:book_id]
    current_user.favorites.create(book_id: params[:book_id])
  end
  redirect_to request.referer
 end
 
 def destroy
   if params[:comment_id]
     current_user.favorites.find_by(comment_id: params[:comment_id]).destroy
   elsif params[:book_id]
     current_user.favorites.find_by(book_id: params[:book_id]).destroy
   end
   redirect_to request.referer
 end
 
end
