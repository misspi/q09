class CuestionarioController < ApplicationController
  def show
    name = params[:id]
    @survey = Survey.find(name, :user_id => 1)
    render :action => name
  end
end
