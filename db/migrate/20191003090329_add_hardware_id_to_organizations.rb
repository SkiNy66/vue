class AddHardwareIdToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :hardware_id, :integer
  end
end
