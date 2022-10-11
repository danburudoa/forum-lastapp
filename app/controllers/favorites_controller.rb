class FavoritesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    favorites = current_user.favorites.new(board_id: params[:board_id], comment_id: @comment.id)
    favorites.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    favorites = current_user.favorites.find_by(board_id: params[:board_id], comment_id: @comment.id)
    favorites.destroy
    redirect_back(fallback_location: root_path)
  end
end
