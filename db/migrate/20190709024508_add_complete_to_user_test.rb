class AddCompleteToUserTest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tests, :complete, :integer, default: 0
  end
end
