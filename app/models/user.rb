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


end
