class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :title
      t.string :kind
      t.string :iin
      t.string :ogrn
    end
  end
end
