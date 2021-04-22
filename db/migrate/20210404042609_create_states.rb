class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :quantity , null: false
      t.integer :unit_id , null: false
      t.integer :limit_id , null: false
      t.datetime :limit_day , null: false
      t.integer :alarm_id , null: false
      t.datetime :alarm_day , null: false
      t.string :storage_name , null: false
      t.string :storage_address , null: false
      t.references :item ,null:false ,foreign_key: true
      t.timestamps
    end
  end
end
