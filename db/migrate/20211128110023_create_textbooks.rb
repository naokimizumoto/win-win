class CreateTextbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :textbooks do |t|
      t.string :name
      t.string :image_id

      t.timestamps
    end
  end
end
