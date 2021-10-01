class Fishing < ApplicationRecord

  # validation
  with_options presence: true do
    validates  :title
    validates  :catch_copy
    validates  :concept
    validates  :image
  end

  # Association
  has_many :comments
  belongs_to :user
  has_one_attached :image

end
