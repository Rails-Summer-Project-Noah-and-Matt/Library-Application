class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create

    # The subclasses need to set item 
    # They may set redirect if it is not the same as item
    
    @redirect ||= @item 
    respond_to do |format|
      if @item.save
        format.html { redirect_to @redirect, notice: "#{@item.class.to_s} was successfully created." }
        format.json { render :show, status: :created, location: @redirect }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

end

