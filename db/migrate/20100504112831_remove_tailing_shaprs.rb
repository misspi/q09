class RemoveTailingShaprs < ActiveRecord::Migration
  def self.up
    Question.all.each do |question|
      if question.name =~ /_#/
        value = question.name[0..-3]
        question.update_attribute(:name, value)
      end
    end
  end

  def self.down
  end
end
