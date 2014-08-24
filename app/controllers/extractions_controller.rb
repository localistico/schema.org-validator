# encoding: UTF-8
# Extraction controller
class ExtractionsController < ApplicationController
  before_action :set_extraction, only: [:show, :edit, :update, :destroy]
  @parse = {}
  @request = false
  @error_url = false
  @url = ''
  # GET /extractions
  # GET /extractions.json
  def index
    # @extractions = Extraction.all
    redirect_to extractions_path + '/new'
  end
  # GET /extractions/1
  # GET /extractions/1.json
  def show
  end
  # GET /extractions/new
  def new
    @request = false
    @error_url = false
    @extraction = Extraction.new
  end
  # GET /extractions/1/edit
  def edit
  end
  # POST /extractions
  # POST /extractions.json
  def create
    init
    create_aux
  end
  # PATCH/PUT /extractions/1
  # PATCH/PUT /extractions/1.json
  def update
    respond_to do |format|
      if @extraction.update(extraction_params)
        format.html { redirect_to @extraction, notice: '' }
        format.json { render :show, status: :ok, location: @extraction }
      else
        format.html { render :edit }
        # format.json {
        # render json: @extraction.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /extractions/1
  # DELETE /extractions/1.json
  def destroy
    @extraction.destroy
    respond_to do |format|
      format.html { redirect_to extractions_url, notice: '' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_extraction
    @extraction = Extraction.find(params[:id])
  end
  # Never trust parameters from the scary internet
  # only allow the white list through.
  def extraction_params
    params.require(:extraction).permit(:url)
  end
  # Initialize variables
  def init
    @extraction = Extraction.new(extraction_params)
    @request = true
    @error_url = false
    @url = @extraction.url
    begin
      @parse = HtmlParser.new(@url)
    rescue
      @error_url = true
    end
  end
  # Auxiliar method to create extractions
  def create_aux
    respond_to do |format|
      if (!@error_url) && @extraction.save
        format.html { render :show }
        format.json { render :show, status: :created, location: @extraction }
      else
        format.html { render :new }
        # format.json {
        # render json: @extraction.errors, status: :unprocessable_entity }
      end
    end
  end
end
