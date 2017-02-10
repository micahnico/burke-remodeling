class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :business_name
      t.string :email
      t.string :phone
      t.string :stage
      t.integer :zip_code_id

      t.timestamps null: false
    end
  end
end
