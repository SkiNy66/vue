class CreateJoinTableOrganizationsClients < ActiveRecord::Migration[6.0]
  def change
    create_join_table :organizations, :clients do |t|
      # t.index [:organization_id, :client_id]
      # t.index [:client_id, :organization_id]
    end
  end
end
