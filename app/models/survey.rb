
class Survey
  def self.find(group, options = {})
    return Survey.new(group, options[:user_id])
  end

  def initialize(group, user_id)
    @group = group
    @user_id = user_id
  end

  def id
    @group
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
    Question.find_or_create_by_group_and_name(@group, name.to_s)
  end

  def method_missing(name, *args)
    answer(name).value
  end

end