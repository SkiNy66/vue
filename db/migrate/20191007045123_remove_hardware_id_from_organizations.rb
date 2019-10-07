class RemoveHardwareIdFromOrganizations < ActiveRecord::Migration[6.0]
  def change
    remove_column :organizations, :hardware_id, :integer
  end
end
