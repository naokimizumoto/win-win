class AddNumberToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :number, :string
  end
end
