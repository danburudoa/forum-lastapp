require 'rails_helper'

RSpec.describe Board, type: :model do
  before do
      @board = FactoryBot.build(:board)
      @board.image = fixture_file_upload('app/assets/images/logo.png')
  end
  
  context "投稿できるとき" do
    it "全ての項目が存在しているとき" do
      expect(@board).to be_valid
    end  
  end

  context "投稿できないとき" do
    it "titleが空の場合、投稿できない" do
      @board.title = ""
      @board.valid?
      expect(@board.errors.full_messages).to include("Titleを入力してください")
    end

    it "textが空の場合、投稿できない" do
      @board.text = ""
      @board.valid?
      expect(@board.errors.full_messages).to include("Textを入力してください")
    end

    it "imageが空の場合、投稿できない" do
      @board.image = nil
      @board.valid?
      expect(@board.errors.full_messages).to include("Imageを入力してください")
    end
    
  end
end