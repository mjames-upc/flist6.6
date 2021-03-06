class TagRecordsController < ApplicationController
  before_action :set_tag_record, only: [:show, :edit, :update, :destroy]

  # GET /tag_records
  # GET /tag_records.json
  def index
    @tag_records = TagRecord.all
  end

  # GET /tag_records/1
  # GET /tag_records/1.json
  def show
  end

  # GET /tag_records/new
  def new
    @tag_record = TagRecord.new
  end

  # GET /tag_records/1/edit
  def edit
  end

  # POST /tag_records
  # POST /tag_records.json
  def create
    @tag_record = TagRecord.new(tag_record_params)
    #@tag_record = TagRecord.new(:franken_beer_id => params[:franken_beer_id], :tag_id => params[:tag_id])

    @tag = Tag.find(@tag_record.tag_id)
    @franken_beer = FrankenBeer.find(@tag_record.franken_beer_id)
    respond_to do |format|
      if @tag_record.save
        format.html { redirect_to @tag }
        #format.json { render :show, status: :created, location: @tag_record }
        format.json { render :json => @tag_record}
      else
        format.html { render :new }
        format.json { render json: @tag_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_records/1
  # PATCH/PUT /tag_records/1.json
  def update
    respond_to do |format|
      if @tag_record.update(tag_record_params)
        format.html { redirect_to @tag_record, notice: 'Record was updated.' }
        format.json { render :show, status: :ok, location: @tag_record }
      else
        format.html { render :edit }
        format.json { render json: @tag_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_records/1
  # DELETE /tag_records/1.json
  def destroy
    @tag_record.destroy
    @tag = Tag.find(@tag_record.tag_id)
    @franken_beer = FrankenBeer.find(@tag_record.franken_beer_id)
    respond_to do |format|
      format.html { redirect_to @tag }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_record
      @tag_record = TagRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_record_params
      params.permit(:franken_beer_id, :tag_id)
    end

end
