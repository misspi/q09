class UserSurveysController < ApplicationController

  before_filter :require_user

  def update
    user_survey = UserSurvey.find(params[:id], current_user.id)
    begin
      user_survey.update(params[:user_survey])
      flash[:notice] = t("survey.saved")
    rescue ActiveRecord::StatementInvalid
      flash[:notice] = t("survey.notsaved")
    end
    redirect_to params[:next_url]
  end
end
