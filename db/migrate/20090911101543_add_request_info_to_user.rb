class AddRequestInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :request_info, :boolean
  end

  def self.down
    remove_column :users, :request_info
  end
end
