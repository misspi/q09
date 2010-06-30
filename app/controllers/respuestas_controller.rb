class RespuestasController < ApplicationController

  def show
    @question = Question.find_by_name(params[:id])
  end
end
