class AddFieldsToSalesSessions < ActiveRecord::Migration
  def change
    add_column :sales_sessions, :walking, :boolean, null: false, default: false
    add_column :sales_sessions, :start_location, :string
  end
end
