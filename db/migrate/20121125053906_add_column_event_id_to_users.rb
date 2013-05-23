class AddColumnEventIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :event_id , :integer
  end

  def self.down
    delete_column :users, :event_id
  end
end
