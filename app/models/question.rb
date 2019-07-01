class Question < ApplicationRecord
  belongs_to :test
  has_many :options

  validates :content, presence: true
end
