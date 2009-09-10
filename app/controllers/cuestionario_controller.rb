class CuestionarioController < ApplicationController
  before_filter :require_user

  IMAGENES = {'presentacion' => 'presentacion', 'tumisma' => 'tumisma', 'experiencias' => "experiencias", 'dineros' => "dineros", 'habitat' => "habitat", 'comun' => "comun", 'red' => "red", 'autoria' => "autoria"}

  def show
    name = params[:id]
    @image = IMAGENES[name]
    @survey = UserSurvey.find(name, current_user.id)
    render :action => name
  end
  
 
end
