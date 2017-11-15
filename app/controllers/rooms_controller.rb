class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /rooms
  # GET /rooms.json
  def index
    @pg_id = params[:pg_id]
    check_room_user(@pg_id)
    @rooms = Room.where(pg_id: @pg_id).order(:room_number)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    check_room_user(@room.pg_id)
    authorize! :show, @room
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @room.pg_id = params[:pg_id]
    authorize! :new, @room
  end

  # GET /rooms/1/edit
  def edit
    check_room_user(@room.pg_id)
    authorize! :edit, @room
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    authorize! :destroy, @room
    pg_id = @room.pg_id
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url(pg_id: pg_id), notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:pg_id, :room_number, :room_type_id, :floor_id, :number_of_beds)
    end

    def check_room_user(pg_id)
      if Pg.find(pg_id).user_id != current_user.id
        redirect_to root_path, alert: "You are not the owner of this room."
      end
    end
end
