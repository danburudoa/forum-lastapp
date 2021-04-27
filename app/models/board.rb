class Board < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one_attached :image
    has_many :board_tag_relations
    has_many :tags, through: :board_tag_relations

end
