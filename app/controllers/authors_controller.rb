class AuthorsController < ApplicationController
  load_and_authorize_resource

  helper_method :sort_column, :sort_direction

  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_filter :check_valid_user, only: [:new, :edit, :update, :destroy]
  
  def index
    @authors = Author.order('family_name ASC, given_name ASC')
  end

  def new
    @author = Author.new
  end

  def create
    @item = @author = Author.new(author_params)
    super
  end

  def update
    @item = @author
    @current_parameters = author_params
    super
  end

  def destroy
    notice = "You can't destroy a published author."
    if @author.destroyable?
      @author.destroy
      notice = 'Author was successfully destroyed.'
    end
    respond_to do |format|
      format.html { redirect_to authors_url, notice: notice }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:given_name, :family_name)
    end
end
