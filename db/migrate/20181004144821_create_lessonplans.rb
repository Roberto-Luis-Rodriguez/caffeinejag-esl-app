class CreateLessonplans < ActiveRecord::Migration[5.1]
  def change
    create_table :lessonplans do |t|
      t.string :name
      t.string :attachment
      t.references :teacher, foreign_key: true

      t.timestamps
    end
    add_index :lessonplans, [:teacher_id, :created_at]
  end
end
