class CreateSalesSessions < ActiveRecord::Migration
  def change
    create_table :sales_sessions do |t|
      t.datetime :ended_at
      t.boolean :active, null: false, default: false
      t.decimal :duration
      t.integer :number_of_actions
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
