class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.string :starts_at
      t.string :finishes_at
      t.text :homework

      t.timestamps
    end
  end
end
