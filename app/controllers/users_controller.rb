class UsersController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_action :require_admin
  skip_before_action :require_admin, only: :stop_impersonating

  before_action :set_user, only: [:show, :edit, :update, :destroy, :block, :unblock, :impersonate, :adminify]

  def impersonate
    impersonate_user(@user)
    redirect_to root_path
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to useradmin_index_path
  end

  def index
    @users = User.order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  def block
    notice = "Couldn't block; something is wrong."
    notice = '' if @user.toggle_blocked!
    redirect_to useradmin_index_path, notice: notice
  end

  def unblock
    notice = "Couldn't unblock; something is wrong."
    notice = '' if @user.toggle_blocked!
    redirect_to useradmin_index_path, notice: notice
  end

  def adminify
    notice = "Couldn't make admin; something is wrong."
    notice = '' if @user.adminify!
    redirect_to useradmin_index_path, notice: notice
  end


  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end
  
  def require_admin
    unless ( current_user && current_user.admin )
      flash[:error] = 'Naughty!'
      redirect_to(root_path) 
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
