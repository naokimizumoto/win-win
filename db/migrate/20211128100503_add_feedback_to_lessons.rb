class AddFeedbackToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :feedback, :text
  end
end
