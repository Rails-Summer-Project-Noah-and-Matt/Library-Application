class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def respond_to_create object, redirect, name
    respond_to do |format|
      if object.save
        format.html { redirect_to redirect, notice: "#{name} was successfully created." }
        format.json { render :show, status: :created, location: redirect }
      else
        format.html { render :new }
        format.json { render json: object.errors, status: :unprocessable_entity }
      end
    end
  end

  def respond_to_destroy object, redirect, name
    respond_to do |format|
      format.html { redirect_to redirect, notice: "#{name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
