class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :wiki_link
      t.text :wiki_text
      t.string :city_name
      t.string :state
      t.decimal :population
      t.string :city_url

      t.timestamps null: false
    end
  end
end
