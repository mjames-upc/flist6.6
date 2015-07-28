class FrankenBeersController < ApplicationController
  before_action :set_franken_beer, only: [:show, :edit, :update, :destroy, :vote]
  helper_method :sort_column, :sort_direction
  require 'will_paginate/array'

  # GET /franken_beers
  # GET /franken_beers.json
  def index
    @franken_beers = FrankenBeer.all.search(params[:search]).order(sort_column + " " + sort_direction).take(25)
  end



  # GET /franken_beers/1
  # GET /franken_beers/1.json
  def show
    @beer_ratings = FrankenRating.where(franken_beer_id: @franken_beer.id)
    @title = "#{@franken_beer.beername} - Franconian Breweries"
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


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @franken_beer.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franken_beer
      @franken_beer = FrankenBeer.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franken_beer_params
      params.require(:franken_beer).permit(:beername, :active, :rbid, :franken_brewery_id)
    end

    def sort_column
      FrankenBeer.column_names.include?(params[:sort]) ? params[:sort] : "beername"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
