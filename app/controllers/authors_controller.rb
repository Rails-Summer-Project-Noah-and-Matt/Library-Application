class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
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
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
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
