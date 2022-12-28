class CreateLevelSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :level_settings do |t|
      t.integer :level, default: 1
      t.integer :thresold, default: 0

      t.timestamps
    end
  end
end
