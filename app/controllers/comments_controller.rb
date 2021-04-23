class CommentsController < ApplicationController
    
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        @time = @comment.created_at.strftime("%Y/%m/%d/ %H:%M:%S")
        ActionCable.server.broadcast 'comment_channel', content: @comment, user: @comment.user, date: @time
      else
        redirect_to board_path(@comment.board) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
      end
    end

    private
    def comment_params
       params.require(:comment).permit(:text).merge(user_id: current_user.id, board_id: params[:board_id])
    end
end
