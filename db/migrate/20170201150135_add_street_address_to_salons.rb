class AddStreetAddressToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :street_address, :string
  end
end
