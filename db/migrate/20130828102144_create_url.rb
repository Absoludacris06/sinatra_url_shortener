class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :webpage
      t.string :key
      t.integer :click_count
      t.timestamps
    end
  end
end
