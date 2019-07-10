class AddExpiredAtToUserTest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tests, :expired_at, :timestamp
  end
end
