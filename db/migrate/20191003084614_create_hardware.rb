class CreateHardware < ActiveRecord::Migration[6.0]
  def change
    create_table :hardwares do |t|
      t.string :title
      t.string :kind
      t.string :serial_number
    end
  end
end
