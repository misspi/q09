class SurveysController < ApplicationController

  def update
    survey = Survey.find(params[:id])
    params[:survey].each_key do |name|
      answer = survey.answer(name)
      answer.value = params[:survey][name]
      answer.save
    end
    redirect_to params[:next_url]
  end
end
