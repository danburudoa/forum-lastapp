class Board < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes
    has_one_attached :image

    validates :image, presence: true
    validates :title, presence: true
    validates :text,  presence: true
end