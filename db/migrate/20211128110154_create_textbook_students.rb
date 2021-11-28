class CreateTextbookStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :textbook_students do |t|
      t.integer :textbook_id
      t.integer :student_id

      t.timestamps
    end
  end
end
