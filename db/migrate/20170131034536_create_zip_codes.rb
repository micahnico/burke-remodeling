class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.integer :zip
      t.integer :city_id
      t.boolean :active_client

      t.timestamps null: false
    end
  end
end
