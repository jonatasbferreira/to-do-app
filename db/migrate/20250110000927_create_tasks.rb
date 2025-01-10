class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :priority
      t.boolean :done, default: false
      t.datetime :due_date
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
