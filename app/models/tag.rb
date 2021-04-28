class Tag < ApplicationRecord
    has_many :board_tag_relations, dependent: :destroy
    has_many :boards, through: :board_tag_relations, dependent: :destroy

    validates :name, uniqueness: true
end
