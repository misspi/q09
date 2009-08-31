class CuestionarioController < ApplicationController

  def presentacion
    @survey = Survey.find('presentacion', :user_id => 1)
  end
end
