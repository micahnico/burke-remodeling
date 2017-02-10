class AddWebsiteBooleanToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :website, :boolean, null: false, default: false
    add_column :salons, :web_address, :string
  end
end
