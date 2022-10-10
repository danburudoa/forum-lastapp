class Comment < ApplicationRecord
    has_many :favorites, dependent: :destroy
    belongs_to :user
    belongs_to :board
    validates :text, presence: true
end
