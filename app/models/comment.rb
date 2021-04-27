class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :board
    has_many :likes

    validates :text, presence: true
end
