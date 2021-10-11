class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# validation
  with_options presence: true do
    validates :name
    validates :rod
    validates :reel
    validates :feed
  end

# Association
  has_many :fishings
  has_many :comments
  has_many :likes
  has_many :favorites, through: :likes, source: :fishing

  def like_this(clicked_fishing)
    self.likes.find_or_create_by(fishing: clicked_fishing)
  end

end
