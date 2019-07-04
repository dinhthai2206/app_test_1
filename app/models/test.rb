class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests
  has_many :members, through: :user_tests
  has_many :questions, inverse_of: :test, dependent: :destroy

  enum status: {draff: 0, publish: 1}

  accepts_nested_attributes_for :questions, reject_if: :all_blank,
    allow_destroy: true

end
