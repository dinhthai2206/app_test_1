class UserTest < ApplicationRecord
  belongs_to :member, class_name: "User", foreign_key: "user_id"
  belongs_to :test
  has_many :user_answers
  
  validates :user_id, uniqueness: {scope: :test_id}

  scope :highest_score, -> {order score: :desc}
end
