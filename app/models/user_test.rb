class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :user_answers
end
