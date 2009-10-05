class UsersController < ApplicationController
  before_filter :admin_required, :only => [:index, :show]
  before_filter :require_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = t(:created)
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = t(:updated)
      redirect_to :action => 'edit'
    else
      render :action => 'edit'
    end
  end
end
