class BedsController < ApplicationController
  before_action :set_bed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /beds
  # GET /beds.json
  def index
    @room_id = params[:room_id]
    check_bed_user(@room_id)
    @beds = Bed.where(room_id: @room_id).order(:bed_number)
  end

  # GET /beds/1
  # GET /beds/1.json
  def show
    check_bed_user(@bed.room_id)
    authorize! :show, @bed
  end

  # GET /beds/new
  def new
    @bed = Bed.new
    @bed.room_id = params[:room_id]
    authorize! :new, @bed
  end

  # GET /beds/1/edit
  def edit
    check_bed_user(@bed.room_id)
    authorize! :edit, @bed
  end

  # POST /beds
  # POST /beds.json
  def create
    @bed = Bed.new(bed_params)
    if(@bed.user_id.nil?)
      @bed.expected_booking_date = ''
      @bed.booked = false
    else
      @bed.booked = true
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
    authorize! :destroy, @bed
    room_id = @bed.room_id
    @bed.destroy
    respond_to do |format|
      format.html { redirect_to beds_url(room_id: room_id), notice: 'Bed was successfully destroyed.' }
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
      params.require(:bed).permit(:bed_number, :room_id, :user_id, :expected_booking_date, :expected_vacancy_date)
    end

    def check_bed_user(room_id)
      if Pg.find(Room.find(room_id).pg_id).user_id != current_user.id
        redirect_to root_path, alert: "You are not the owner of this bed."
      end
    end
end
