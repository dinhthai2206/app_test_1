class Question < ApplicationRecord
  belongs_to :test
  has_many :options, inverse_of: :question, dependent: :destroy
  has_many :user_answers

  accepts_nested_attributes_for :options, reject_if: :all_blank,
    allow_destroy: true

  validates :content, presence: true
  validate :correct_option, :option_numbers

  def correct_option
    if options.select{|option| option.right? && !option.marked_for_destruction?}.count != 1
      errors.add(:options, "- There must be only 1 correct option")
    end
  end

  def option_numbers
    if options.select{|option| !option.marked_for_destruction?}.count <= 1
      errors.add(:options, "must be greater than 1")
    end
  end
end
