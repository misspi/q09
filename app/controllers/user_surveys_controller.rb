class UserSurveysController < ApplicationController

  def update
    survey = UserSurvey.find(params[:id])
    survey.update_attributes(params[:survey])
    redirect_to params[:next_url]
  end
end
