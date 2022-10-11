class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :nickname, presence: true, length: { maximum: 20}
  validates :email, presence: true

  # いいねを押したか押してないかを判定
  def already_favorited?(comment)
    # current_user.favorite.find_by(recipe_id: params[:recipe_id]).present?
    self.favorites.exists?(comment_id: comment.id)
  end

end
