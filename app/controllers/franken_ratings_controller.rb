class FrankenRatingsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_franken_rating, only: [:show, :edit, :update, :destroy]

  # GET /franken_ratings
  # GET /franken_ratings.json
  def index
    @franken_ratings = FrankenRating.all
  end

  # GET /franken_ratings/1
  # GET /franken_ratings/1.json
  def show
  end

  # GET /franken_ratings/new
  def new
    @franken_rating = FrankenRating.new
  end

  # GET /franken_ratings/1/edit
  def edit
  end

  # POST /franken_ratings
  # POST /franken_ratings.json
  def create
    @franken_rating = FrankenRating.new(franken_rating_params)

    respond_to do |format|
      if @franken_rating.save
        format.html { redirect_to @franken_rating, notice: 'Franken rating was successfully created.' }
        format.json { render :show, status: :created, location: @franken_rating }
      else
        format.html { render :new }
        format.json { render json: @franken_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franken_ratings/1
  # PATCH/PUT /franken_ratings/1.json
  def update
    respond_to do |format|
      if @franken_rating.update(franken_rating_params)
        format.html { redirect_to @franken_rating, notice: 'Franken rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @franken_rating }
      else
        format.html { render :edit }
        format.json { render json: @franken_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franken_ratings/1
  # DELETE /franken_ratings/1.json
  def destroy
    @franken_rating.destroy
    respond_to do |format|
      format.html { redirect_to franken_ratings_url, notice: 'Franken rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franken_rating
      @franken_rating = FrankenRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franken_rating_params
      params.require(:franken_rating).permit(:score, :comment, :serving, :user_id, :franken_beer_id, :franken_brewery_id)
    end
end
