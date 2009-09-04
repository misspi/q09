class UserSurveysController < ApplicationController

  before_filter :require_user

  def update
    survey = UserSurvey.find(params[:id], current_user.id)
    survey.update_attributes(params[:user_survey])
    redirect_to params[:next_url]
  end
end
