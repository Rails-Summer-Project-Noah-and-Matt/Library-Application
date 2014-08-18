class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def respond_to_create params
    thing    = params[:thing]
    redirect = params[:redirect] ? params[:redirect] : thing
    name     = params[:name]     ? params[:name]     : thing.class.to_s

    respond_to do |format|
      if thing.save
        format.html { redirect_to redirect, notice: "#{name} was successfully created." }
        format.json { render :show, status: :created, location: redirect }
      else
        format.html { render :new }
        format.json { render json: thing.errors, status: :unprocessable_entity }
      end
    end
  end

  def respond_to_destroy params
    thing    = params[:thing]
    redirect = params[:redirect]
    name     = params[:name]     ? params[:name]     : thing.class.to_s

    respond_to do |format|
      format.html { redirect_to redirect, notice: "#{name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
