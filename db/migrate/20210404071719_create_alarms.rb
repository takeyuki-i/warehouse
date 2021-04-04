class CreateAlarms < ActiveRecord::Migration[6.0]
  def change
    create_table :alarms do |t|

      t.timestamps
    end
  end
end
