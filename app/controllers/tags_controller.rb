class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find_by_simple!(params[:id])
    @tag_records = FrankenBeer.joins(:tag_records).where(tag_records: { tag_id: @tag.id }).select('distinct franken_beers.*, tag_records.id as tag_record_id').to_a
    if params.has_key?(:search)
      #@franken_beers =  FrankenBeer.all.search(params[:search]).order(sort_column + " " + sort_direction)

      #@franken_beers =  FrankenBeer.find(:all,:conditions => ["franken_beers.id NOT IN (?)", @tag_records.id])
      #@franken_beers =  FrankenBeer.where.not(id: @tag_records.id)

      #@franken_beers =  FrankenBeer.find(:all, :conditions => ["franken_beers.id NOT IN (?)", @tag_records.id])


      #@franken_beers =  FrankenBeer.where('id NOT IN (SELECT DISTINCT(franken_beer_id) FROM tag_records where tag_id = )')

      @franken_beers = FrankenBeer.includes(:tag_records).where(tag_records: { franken_beer_id: nil }).search(params[:search]).order(sort_column + " " + sort_direction)

    else
      @franken_beers = []
    end
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show,  location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find_by_simple!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :simple)
    end
    def sort_column
      FrankenBeer.column_names.include?(params[:sort]) ? params[:sort] : "beername"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
