class RemoveTeacherIdFromTextbooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :textbooks, :teacher_id, :integer
  end
end
