class FrankenBreweriesController < ApplicationController
  before_action :set_franken_brewery, only: [:show, :edit, :update, :destroy]

  # GET /franken_breweries
  # GET /franken_breweries.json
  def index
    @franken_breweries = FrankenBrewery.all
    @franken_breweries_active = FrankenBrewery.all.where(:active => true)
    @franken_breweries_retired = FrankenBrewery.all.where(:active => false)
    @markers_breweries_active = Gmaps4rails.build_markers(@franken_breweries_active) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
        "url" => view_context.image_path('/icons/pin_r.png'),
        "width" => 12,
        "height" => 20
      })
    end
    @markers_breweries_retired = Gmaps4rails.build_markers(@franken_breweries_retired) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
        "url" => view_context.image_path('/icons/pin_r.png'),
        "width" => 12,
        "height" => 20
      })
    end
  end

  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "#{self.lat}"
  end

  def gmaps4rails_title
    # add here whatever text you desire
    "titlestring"
  end

  # GET /franken_breweries/1
  # GET /franken_breweries/1.json
  def show
    @brewery_records = FrankenBeer.where(rbbrewer: @franken_brewery.rbid)
    @brewery_ratings = FrankenRating.where(franken_brewery_id: @franken_brewery.id)
    @title = "#{@franken_brewery.brewer_name}, #{@franken_brewery.city}, #{@franken_brewery.district} Franconia"
  end

  def city
    @city_breweries = FrankenBrewery.where(city: @franken_brewery.city)
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
      @franken_brewery = FrankenBrewery.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franken_brewery_params
      params.require(:franken_brewery).permit(:brewer_name, :address, :city, :district, :rbid, :active, :founded, :brewer_type, :score, :lat, :lon, :web, :hours, :description, :phone)
    end
end
