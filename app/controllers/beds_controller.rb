class BedsController < ApplicationController
  before_action :set_bed, only: [:show, :edit, :update, :destroy]

  # GET /beds
  # GET /beds.json
  def index
    @beds = Bed.all
  end

  # GET /beds/1
  # GET /beds/1.json
  def show
  end

  # GET /beds/new
  def new
    @bed = Bed.new
    @bed.room_id = params[:room_id]
  end

  # GET /beds/1/edit
  def edit
  end

  # POST /beds
  # POST /beds.json
  def create
    @bed = Bed.new(bed_params)
    if(@bed.user_id.nil?)
      @bed.expected_booking_date = ''
    end
    if(!@bed.booked)
      @bed.expected_vacancy_date = ''
    end

    respond_to do |format|
      if @bed.save
        format.html { redirect_to @bed, notice: 'Bed was successfully created.' }
        format.json { render :show, status: :created, location: @bed }
      else
        format.html { render :new }
        format.json { render json: @bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beds/1
  # PATCH/PUT /beds/1.json
  def update
    respond_to do |format|
      if @bed.update(bed_params)
        format.html { redirect_to @bed, notice: 'Bed was successfully updated.' }
        format.json { render :show, status: :ok, location: @bed }
      else
        format.html { render :edit }
        format.json { render json: @bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beds/1
  # DELETE /beds/1.json
  def destroy
    @bed.destroy
    respond_to do |format|
      format.html { redirect_to beds_url, notice: 'Bed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bed
      @bed = Bed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bed_params
      params.require(:bed).permit(:bed_number, :room_id, :user_id, :booked, :expected_booking_date, :expected_vacancy_date)
    end
end
