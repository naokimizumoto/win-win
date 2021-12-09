class RemoveStudentIdFromTextbooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :textbooks, :student_id, :integer
  end
end
