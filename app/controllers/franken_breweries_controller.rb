class FrankenBreweriesController < ApplicationController
  before_action :set_franken_brewery, only: [:show, :edit, :update, :destroy]

  # GET /franken_breweries
  # GET /franken_breweries.json
  def index
    @franken_breweries = FrankenBrewery.all
  end

  # GET /franken_breweries/1
  # GET /franken_breweries/1.json
  def show
  end

  # GET /franken_breweries/new
  def new
    @franken_brewery = FrankenBrewery.new
  end

  # GET /franken_breweries/1/edit
  def edit
  end

  # POST /franken_breweries
  # POST /franken_breweries.json
  def create
    @franken_brewery = FrankenBrewery.new(franken_brewery_params)

    respond_to do |format|
      if @franken_brewery.save
        format.html { redirect_to @franken_brewery, notice: 'Franken brewery was successfully created.' }
        format.json { render :show, status: :created, location: @franken_brewery }
      else
        format.html { render :new }
        format.json { render json: @franken_brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franken_breweries/1
  # PATCH/PUT /franken_breweries/1.json
  def update
    respond_to do |format|
      if @franken_brewery.update(franken_brewery_params)
        format.html { redirect_to @franken_brewery, notice: 'Franken brewery was successfully updated.' }
        format.json { render :show, status: :ok, location: @franken_brewery }
      else
        format.html { render :edit }
        format.json { render json: @franken_brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franken_breweries/1
  # DELETE /franken_breweries/1.json
  def destroy
    @franken_brewery.destroy
    respond_to do |format|
      format.html { redirect_to franken_breweries_url, notice: 'Franken brewery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franken_brewery
      @franken_brewery = FrankenBrewery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franken_brewery_params
      params.require(:franken_brewery).permit(:brewer_name, :address, :city, :district, :rbid, :active, :founded, :brewer_type, :score, :lat, :lon, :web, :hours, :description, :phone)
    end
end
