class AddDefaultValueToTest < ActiveRecord::Migration[5.2]
  def change
    change_column :tests, :status, :integer, default: 0
  end
end
