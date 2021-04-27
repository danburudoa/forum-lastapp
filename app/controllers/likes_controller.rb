class LikesController < ApplicationController

    def create
        @comment_id = Comment.find(params[:comment_id])
        session[:comment_id] = @comment_id.id
        @like = Like.create( comment_id: session[:comment_id])
        @likes = Like.where( comment_id: session[:comment_id])
        @comment_id.reload   #ここでリロードしなくてもいいように更新処理してくれてる
      end
      
end
