class AddTimezoneToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :time_zone, :string
  end
end
