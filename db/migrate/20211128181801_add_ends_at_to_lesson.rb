class AddEndsAtToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :ends_at, :datetime
  end
end
