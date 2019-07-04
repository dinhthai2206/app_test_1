class AddCorrectToOption < ActiveRecord::Migration[5.2]
  def change
    add_column :options, :correct, :integer, default: 0
  end
end
