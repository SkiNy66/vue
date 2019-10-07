class AddPrganizationIdToHardwares < ActiveRecord::Migration[6.0]
  def change
    add_column :hardwares, :organization_id, :integer
  end
end
