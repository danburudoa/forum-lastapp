class BoardsTag

    include ActiveModel::Model
    attr_accessor :title,:text,:name
  
    with_options presence: true do
      validates :image, presence: true
      validates :title, presence: true
      validates :text,  presence: true
      validates :name
    end
  
    def save
      tweet = Tweet.create(image: image, title: title, text: text)
      tag = Tag.create(name: name)
  
      BoardTagRelation.create(board_id: board.id, tag_id: tag.id)
    end
  
  end