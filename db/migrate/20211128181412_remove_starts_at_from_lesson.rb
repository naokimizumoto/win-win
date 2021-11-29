class RemoveStartsAtFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :starts_at, :string
  end
end
