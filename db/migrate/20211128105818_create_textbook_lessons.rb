class CreateTextbookLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :textbook_lessons do |t|
      t.integer :lesson_id
      t.integer :textbook_id

      t.timestamps
    end
  end
end
