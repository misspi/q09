
class Survey
  def self.find(group, options = {})
    return Survey.new(group, options[:user_id])
  end

  def initialize(group, user_id)
    @group = group
    @user_id = user_id
  end

  def id
    1
  end

  def new_record?
    false
  end

  def to_param
    @group
  end

  def answer(name)
    q = question(name)
    Answer.find_or_create_by_question_id_and_user_id(q.id, @user_id)
  end

  def question(name)
    name = name.to_s
    q = Question.find(:first, :conditions => {:group => @group, :name => name})
    raise ActiveRecord::RecordNotFound.new("Question '#{name}' in '#{@group}' doesn't exsist!.") if q.nil?
    q
  end

  def method_missing(name, *args)
    answer(name).value
  end

end