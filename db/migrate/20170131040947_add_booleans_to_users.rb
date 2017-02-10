class AddBooleansToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :agent, :boolean
    add_column :users, :salon_owner, :boolean
  end
end
