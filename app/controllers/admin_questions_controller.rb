class AdminQuestionsController < AdminController
  inherit_resources
  defaults :resource_class => Question, :collection_name => 'questions', :instance_name => 'question'

  def index
    if params[:group].blank?
      @questions = Question.find(:all)
    else
      @group = params[:group]
      @questions = Question.all(:conditions => {:group => @group})
    end
    index!
  end

  def update
    update! { questions_path}
  end
end
