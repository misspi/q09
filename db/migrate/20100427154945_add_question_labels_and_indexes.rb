class AddQuestionLabelsAndIndexes < ActiveRecord::Migration
  def self.up
    add_column :questions, :title, :string
    add_index :questions, :group
    add_index :questions, :name
  end

  def self.down
    remove_column :questions, :title
    remove_index :questions, :group
    remove_index :questions, :name
  end
end
