class CreateSalesActions < ActiveRecord::Migration
  def change
    create_table :sales_actions do |t|
      t.boolean :completed, null: false, default: false
      t.decimal :duration
      t.datetime :ended_at
      t.references :user, index: true, foreign_key: true
      t.references :salon, index: true, foreign_key: true
      t.references :sales_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
