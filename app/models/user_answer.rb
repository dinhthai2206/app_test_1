class UserAnswer < ApplicationRecord
  belongs_to :user_test
  belongs_to :question
  belongs_to :option

  scope :right, ->{joins(:option).merge(Option.right)}
end
