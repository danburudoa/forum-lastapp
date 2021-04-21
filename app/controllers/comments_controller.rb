class CommentsController < ApplicationController
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to board_path(@comment.board) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
      else
          @board = @comment.board
          @comments = @board.comments
          render "boards/show" # views/tweets/show.html.erbのファイルを参照しています。
        end
    end

    private
    def comment_params
       params.require(:comment).permit(:text).merge(user_id: current_user.id, board_id: params[:board_id])
    end
end
