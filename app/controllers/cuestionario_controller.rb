class CuestionarioController < ApplicationController
  before_filter :require_user

  def show
    name = params[:id]
    @survey = UserSurvey.find(name, current_user.id)
    render :action => name
  end
  
 
end
