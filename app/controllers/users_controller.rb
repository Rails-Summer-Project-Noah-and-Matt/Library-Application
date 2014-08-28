class UsersController < ApplicationController

  before_action :require_admin

  before_action :set_user, only: [:show, :edit, :update, :destroy, :block, :unblock]

  def index
    @users = User.order("email ASC").paginate(:page => params[:page])
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

  private

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
