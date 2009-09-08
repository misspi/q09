class UserSurveysController < ApplicationController

  before_filter :require_user

  def update
    user_survey = UserSurvey.find(params[:id], current_user.id)
    user_survey.update(params[:user_survey])
    redirect_to params[:next_url]
  end
end
