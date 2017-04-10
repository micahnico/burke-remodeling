class CreateFormContacts < ActiveRecord::Migration
   def change
    create_table :form_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :zip_code
      t.text :message

      t.timestamps null: false
    end
  end
end
