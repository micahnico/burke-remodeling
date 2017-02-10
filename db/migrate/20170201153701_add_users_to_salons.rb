class AddUsersToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :user_id, :integer
  end
end
