class Count < ApplicationRecord
    belongs_to :user
    belongs_to :board
    belongs_to :comment

    validates_uniqueness_of :comment_id, scope: :user_id
end
