class Question < ActiveRecord::Base
  has_many :answers, :include => [:user]

  def self.apply_title(group, name, title)
    if !title.blank?
      q = Question.find_by_group_and_name(group.to_s, name.to_s)
      puts "Pregunta #{q.group} #{q.name} = #{title}"
      q.update_attribute(:title, title)
    end
  end
end
