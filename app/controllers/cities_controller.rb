class CitiesController < ApplicationController
  before_action :set_city, only: [:show]

  # GET /cities
  # GET /cities.json
  def index
    #@unique_cities = FrankenBrewery.all.map{|t| t.city}.uniq.sort.count(:city)
    @unique_cities = FrankenBrewery.all.group(:city).count.sort
  end

  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "#{self.lat}"
  end

  def gmaps4rails_title
    # add here whatever text you desire
    "titlestring"
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
   # @city_records = FrankenBrewery.where(city: @unique_cities.city)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = FrankenBrewery.where(city: params[:id])
      @city_markers = Gmaps4rails.build_markers(@city) do |franken_brewery, marker|
        marker.lat franken_brewery.lat
        marker.lng franken_brewery.lon
        marker.picture({
          "url" => view_context.image_path('/icons/pin_r.png'),
          "width" => 12,
          "height" => 20
        })
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franken_brewery_params
      params.require(:franken_brewery).permit(:brewer_name, :address, :city, :district, :rbid, :active, :founded, :brewer_type, :score, :lat, :lon, :web, :hours, :description, :phone)
    end
end
