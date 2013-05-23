class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :time
      t.string :venue
      t.boolean :current_event, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
