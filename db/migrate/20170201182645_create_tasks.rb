class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.boolean :text_alert
      t.datetime :due_at
      t.datetime :completed_at
      t.boolean :completed
      t.references :salon, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
