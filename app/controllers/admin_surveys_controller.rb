# muestra los cuestionarios completos por cada usuario

class AdminSurveysController < AdminController

  def show
    @user = User.find(params[:id])
  end
end
