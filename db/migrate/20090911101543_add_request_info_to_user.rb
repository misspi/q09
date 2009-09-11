class AddRequestInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :request_info, :boolean
    add_column :users, :allow_publish, :boolean
  end

  def self.down
    remove_column :users, :request_info
    remove_column :users, :allow_publish
  end
end
