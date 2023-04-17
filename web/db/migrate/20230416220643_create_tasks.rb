class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :goal
      t.json :generated_tasks
      t.timestamps
    end
  end
end
