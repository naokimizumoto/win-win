class AddTextNameToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :text_name, :string
  end
end
