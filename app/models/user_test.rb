class UserTest < ApplicationRecord
  belongs_to :member, class_name: "User", foreign_key: "user_id"
  belongs_to :test
  has_many :user_answers

  enum complete: {uncompleted: 0, completed: 1}

  validates :user_id, uniqueness: {scope: :test_id}

  scope :highest_score, -> {order score: :desc}

  after_update :update_score

  def update_score
    result = user_answers.right.size.to_f / test.questions.size * 10
    update_column(:score, result)
  end
end
