class AddStartsAtToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :starts_at, :datetime
  end
end
