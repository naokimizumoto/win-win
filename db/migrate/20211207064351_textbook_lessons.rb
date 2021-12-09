class TextbookLessons < ActiveRecord::Migration[5.2]
  def change
     drop_table :textbook_lessons
  end
end
