class AddSubgroupToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :subgroup, :string
    Question.all.each do |q|
      q.update_attribute(:subgroup, q.name)
    end
  end

  def self.down
    remove_column :questions, :subgroup
  end
end
