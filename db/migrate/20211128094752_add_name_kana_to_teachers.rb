class AddNameKanaToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :name_kana, :string
  end
end
