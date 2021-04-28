class BoardsTag

    include ActiveModel::Model
    attr_accessor :image,:title,:text,:name,:user_id
  
    with_options presence: true do
      validates :image
      validates :title
      validates :text
      validates :name
    end
  
    def save
      board = Board.create(image: image, title: title, text: text, user_id: user_id)    
      tag = Tag.where(name: name).first_or_initialize
      tag.save
  
      BoardTagRelation.create(board_id: board.id, tag_id: tag.id)
      
    end
  
  end