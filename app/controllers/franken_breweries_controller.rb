class FrankenBreweriesController < ApplicationController
  before_action :set_franken_brewery, only: [:show, :edit, :update, :destroy]


# frankenbier_development-# update franken_ratings set franken_brewery_id = (select id from franken_breweries where rbid = franken_ratings.rbbrewer);
# frankenbier_development-# update franken_ratings set franken_beer_id = (select id from franken_beers where rbid = franken_ratings.rbid);



  # GET /franken_breweries
  # GET /franken_breweries.json
  def index
    @franken_breweries = FrankenBrewery.all
    @franken_beers = FrankenBeer.all
    @unique_cities = FrankenBrewery.all.group(:city).count.sort

    @franken_breweries_retired = FrankenBrewery.all.where(:active => false)
    @markers_breweries_retired = Gmaps4rails.build_markers(@franken_breweries_retired) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
        "url" => view_context.image_path('/icons/pin_r.png'),
        "width" => 12,"height" => 20
      })
      marker.title franken_brewery.brewer_name
      marker.infowindow render_to_string(:partial => "/franken_breweries/mapwindow", :locals => { :franken_brewery => franken_brewery}).gsub(/\n/, '').gsub(/"/, '\"')
    end

    #@franken_breweries_active = FrankenBrewery.all.where(:active => true)

    @franken_breweries_active = FrankenBrewery.select("franken_breweries.*, COUNT(franken_beers.id) beer_count").joins("LEFT OUTER JOIN franken_beers ON franken_beers.franken_brewery_id = franken_breweries.id").where(:active => true).group("franken_breweries.id").order("brewer_name   asc")


    @franken_breweries_upper = FrankenBrewery.all.where(district: "Upper", :active => true)
    @franken_breweries_middle = FrankenBrewery.all.where(district: "Middle", :active => true)
    @franken_breweries_lower = FrankenBrewery.all.where(district: "Lower", :active => true)
    #@franken_breweries_active = FrankenBrewery.all.search(params[:search]).order(sort_column + " " + sort_direction).take(25)
    #@franken_breweries_active = FrankenBrewery.all.search(params[:search])

    @markers_breweries_active = Gmaps4rails.build_markers(@franken_breweries_active) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
                         "url" => view_context.image_path('/icons/pin_r.png'),
                         "width" => 12, "height" => 20 })
      marker.title franken_brewery.brewer_name
      marker.infowindow render_to_string(:partial => "/franken_breweries/mapwindow", :locals => { :franken_brewery => franken_brewery}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.json({ :id => franken_brewery.id })
    end
    @markers_breweries_upper = Gmaps4rails.build_markers(@franken_breweries_upper) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
                         "url" => view_context.image_path('/icons/pin_r.png'),
                         "width" => 12, "height" => 20 })
      marker.title franken_brewery.brewer_name
      marker.infowindow render_to_string(:partial => "/franken_breweries/mapwindow", :locals => { :franken_brewery => franken_brewery}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.json({ :id => franken_brewery.id })
    end
    @markers_breweries_middle = Gmaps4rails.build_markers(@franken_breweries_middle) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
                         "url" => view_context.image_path('/icons/pin_r.png'),
                         "width" => 12,"height" => 20 })
      marker.title franken_brewery.brewer_name
      marker.infowindow render_to_string(:partial => "/franken_breweries/mapwindow", :locals => { :franken_brewery => franken_brewery}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.json({ :id => franken_brewery.id })
    end
    @markers_breweries_lower = Gmaps4rails.build_markers(@franken_breweries_lower) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
                         "url" => view_context.image_path('/icons/pin_r.png'),
                         "width" => 12, "height" => 20 })
      marker.title franken_brewery.brewer_name
      marker.infowindow render_to_string(:partial => "/franken_breweries/mapwindow", :locals => { :franken_brewery => franken_brewery}).gsub(/\n/, '').gsub(/"/, '\"')
      marker.json({ :id => franken_brewery.id })
    end
    # if (params[:district])
    #   @franken_breweries_active = FrankenBrewery.all.where(district: params[:district], :active => true)
    # else
    #   @franken_breweries_active = FrankenBrewery.all.where(:active => true)
    # end
    # @markers_breweries_active = Gmaps4rails.build_markers(@franken_breweries_active) do |franken_brewery, marker|
    #   marker.lat franken_brewery.lat
    #   marker.lng franken_brewery.lon
    #   marker.picture({
    #      "url" => view_context.image_path('/icons/pin_r.png'),
    #      "width" => 12,
    #      "height" => 20
    #  })
    # end
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
    @franken_breweries_active = FrankenBrewery.all.where(:active => true)
    @franken_brewery_markers = Gmaps4rails.build_markers(@franken_breweries_active) do |franken_brewery, marker|
      marker.lat franken_brewery.lat
      marker.lng franken_brewery.lon
      marker.picture({
                         "url" => view_context.image_path('/icons/pin_r.png'),
                         "width" => 12, "height" => 20 })
      marker.infowindow "<h3><a href="">" + franken_brewery.brewer_name + "</a></h3>"
      marker.title franken_brewery.brewer_name
    end
    #@brewery_records = FrankenBeer.where(franken_brewery_id: @franken_brewery.id)
    @brewery_ratings = FrankenRating.where(franken_brewery_id: @franken_brewery.id)

    #@brewery_records = FrankenBeer.where(franken_brewery_id: @franken_brewery.id).joins(:franken_ratings).group("franken_beers.id").select("franken_beers.*, count(franken_ratings.id) as user_count")
    @brewery_records = FrankenBeer.includes(:franken_ratings).where(franken_brewery_id: @franken_brewery.id)
=begin
    @brewery_records = FrankenBeer.find_by_sql("SELECT franken_beers.*, COUNT(franken_ratings.id)
 AS c FROM franken_beers, franken_ratings WHERE franken_ratings.franken_beer_id = franken_beers.id
 GROUP BY franken_beers.id ORDER BY c DESC")
=end
    @brewery_ratings = FrankenRating.where(franken_brewery_id: @franken_brewery.id)
    @title = "#{@franken_brewery.brewer_name}, #{@franken_brewery.city}, #{@franken_brewery.district} Franconia"
  end

  def city
    @city_breweries = FrankenBrewery.where(city: @franken_brewery.city)
  end

  def district
    @district_breweries = FrankenBrewery.where(district: @franken_brewery.district)
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
      params.require(:franken_brewery).permit(:brewer_name, :id, :address, :city, :district, :rbid, :active, :founded, :brewer_type, :score, :lat, :lon, :web, :hours, :description, :phone)
    end

end
