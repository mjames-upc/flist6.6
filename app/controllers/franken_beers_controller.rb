class FrankenBeersController < ApplicationController
  before_action :set_franken_beer, only: [:show, :edit, :update, :destroy]

  # GET /franken_beers
  # GET /franken_beers.json
  def index
    @franken_beers = FrankenBeer.all
  end

  # GET /franken_beers/1
  # GET /franken_beers/1.json
  def show
  end

  # GET /franken_beers/new
  def new
    @franken_beer = FrankenBeer.new
  end

  # GET /franken_beers/1/edit
  def edit
  end

  # POST /franken_beers
  # POST /franken_beers.json
  def create
    @franken_beer = FrankenBeer.new(franken_beer_params)

    respond_to do |format|
      if @franken_beer.save
        format.html { redirect_to @franken_beer, notice: 'Franken beer was successfully created.' }
        format.json { render :show, status: :created, location: @franken_beer }
      else
        format.html { render :new }
        format.json { render json: @franken_beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franken_beers/1
  # PATCH/PUT /franken_beers/1.json
  def update
    respond_to do |format|
      if @franken_beer.update(franken_beer_params)
        format.html { redirect_to @franken_beer, notice: 'Franken beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @franken_beer }
      else
        format.html { render :edit }
        format.json { render json: @franken_beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franken_beers/1
  # DELETE /franken_beers/1.json
  def destroy
    @franken_beer.destroy
    respond_to do |format|
      format.html { redirect_to franken_beers_url, notice: 'Franken beer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franken_beer
      @franken_beer = FrankenBeer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franken_beer_params
      params.require(:franken_beer).permit(:beername, :active, :rbid, :franken_brewery_id)
    end
end
