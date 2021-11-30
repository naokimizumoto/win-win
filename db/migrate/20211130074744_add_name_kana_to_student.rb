class AddNameKanaToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :name_kana, :string
  end
end
