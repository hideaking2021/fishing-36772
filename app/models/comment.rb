class Comment < ApplicationRecord

# Association
  belongs_to :user
  belongs_to :fishing

# validation
  validates :text, presence: true

end
