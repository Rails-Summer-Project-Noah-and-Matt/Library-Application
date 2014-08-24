class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def check_valid_user
      unless current_user
        redirect_to :back, notice: "You must login to or sign up to user this feature"
        return
      end
  end


def create
    # The subclasses need to set @item 
    # They may set @redirect if it is not the same as @item
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

  def update
    # The subclasses need to set @item and @current_parameters
    # They may set @redirect if it is not the same as @item
    @redirect ||= @item 
    
    respond_to do |format|
      if @item.update(@current_parameters)
        format.html { redirect_to @redirect, notice: "#{@item.class.to_s} was successfully updated." }
        format.json { render :show, status: :ok, location: @redirect }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
end

