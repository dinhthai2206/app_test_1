class Option < ApplicationRecord
  belongs_to :question
  has_many :user_answers

  validates :content, presence: true

  enum correct: {wrong: 0, right: 1}
end
