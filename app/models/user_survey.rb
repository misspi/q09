require 'yaml'

class UserSurvey
  def self.find(group, user_id)
    return UserSurvey.new(group, user_id)
  end

  def initialize(group, user_id)
    @group = group
    @user_id = user_id
    @questions = {}
    @answers = {}

    q = Question.all(:conditions => {:group => group})
    a = Answer.all(:include => :question,
      :conditions => {:user_id => user_id, :question_id => q})

    a.each do |answer|
      name = answer.question.name
      @questions[name] = answer.question
      @answers[name] = answer
      instance_eval("def #{name}()\n '#{answer.value}'\n end")
    end

  end

  def update(params)
    Answer.transaction do
      params.each_key do |name|
        answer = answer(name)
        answer.value = params[name]
        answer.save!
      end
    end
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

  def questions
    @questions.values
  end

  def answers
    @answers.values
  end

  def answer(name)
    @answers[name]  ||= Answer.find_or_create_by_question_id_and_user_id(question(name).id, @user_id)
    #@answers[name]  ||= Answer.find_by_question_id_and_user_id(question(name).id, @user_id)
  end

  def question(name)
    @questions[name] ||= Question.find_or_create_by_group_and_name(@group, name.to_s)
    #@questions[name] ||= Question.find_by_group_and_name(@group, name.to_s)
  end

  def qt(name)
    question(name.to_s).title
  end

  def method_missing(name, *args)
    answer(name.to_s).value
  end

end