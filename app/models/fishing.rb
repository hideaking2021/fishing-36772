class Fishing < ApplicationRecord

  # validation
  with_options presence: true do
    validates  :title
    validates  :catch_copy
    validates  :concept
    validates  :image
  end

  # Association
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def self.search(search)
    if search != ""
      Fishing.where('title LIKE(?)', "%#{search}%")
    else
      Fishing.all
    end
  end

end
