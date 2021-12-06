class AddStudentIdToTextbooks < ActiveRecord::Migration[5.2]
  def change
    add_column :textbooks, :student_id, :integer
    add_column :textbooks, :teacher_id, :integer
  end
end
