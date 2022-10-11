class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :board
  belongs_to :comment

  # recipe_idとuser_idの組がuniqueになったので、一通りしかない
  validates_uniqueness_of :comment_id, scope: :user_id
end
