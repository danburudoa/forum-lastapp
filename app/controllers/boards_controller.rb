class BoardsController < ApplicationController
    before_action :authenticate_user!,only:[:create,:edit,:update,:destroy]
    before_action :set_tweet, only: [:edit, :show,:update,:destroy]
 
    def index
      @boards = Board.includes(:user).all.order(created_at: :desc)
      @board_page = Board.all.page(params[:page]).per(10)
    end
    
    def new
       @board = BoardsTag.new
    end
 
    def create
      @board = BoardsTag.new(board_params)
      if @board.valid?
        @board.save
        return redirect_to root_path
      else
        render "new"
      end
    end
  
    
    def show  
       @comment = Comment.new
       @comments = @board.comments.order(created_at: :desc).includes(:user).page(params[:page]).per(50)
    end
 
    def edit
       
    end
 
    def update
      @board = BoardsTag.new(board_params)
      @board.update(board_params)
       if @board.valid?
         @board.save
         return redirect_to root_path
       else 
          render :edit
       end
    end
 
    def destroy
      @board.destroy
      redirect_to root_path
    end
 
    private
 
    def board_params
       params.require(:boards_tag).permit(:title,:text,:image,:name).merge(user_id: current_user.id)
    end
 
    def set_tweet
       @board = Board.find(params[:id])
     end
 end