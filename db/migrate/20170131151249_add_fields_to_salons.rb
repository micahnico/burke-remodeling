class AddFieldsToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :mobile_ready, :boolean, null: false, default: false
    add_column :salons, :appointment_scheduling, :boolean, null: false, default: false
    add_column :salons, :contact, :string
  end
end
