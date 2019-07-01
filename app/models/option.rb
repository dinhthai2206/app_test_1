class Option < ApplicationRecord
  belongs_to :question
  has_many :answer

  validates :content, presence: true
end
