class PgsController < ApplicationController
  before_action :set_pg, only: [:show, :edit, :update, :destroy]

  # GET /pgs
  # GET /pgs.json
  def index
    @pgs = Pg.all
  end

  # GET /pgs/1
  # GET /pgs/1.json
  def show
  end

  # GET /pgs/new
  def new
    @pg = Pg.new
  end

  # GET /pgs/1/edit
  def edit
  end

  # POST /pgs
  # POST /pgs.json
  def create
    @pg = Pg.new(pg_params)

    respond_to do |format|
      if @pg.save
        format.html { redirect_to @pg, notice: 'Pg was successfully created.' }
        format.json { render :show, status: :created, location: @pg }
      else
        format.html { render :new }
        format.json { render json: @pg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pgs/1
  # PATCH/PUT /pgs/1.json
  def update
    respond_to do |format|
      if @pg.update(pg_params)
        format.html { redirect_to @pg, notice: 'Pg was successfully updated.' }
        format.json { render :show, status: :ok, location: @pg }
      else
        format.html { render :edit }
        format.json { render json: @pg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pgs/1
  # DELETE /pgs/1.json
  def destroy
    @pg.destroy
    respond_to do |format|
      format.html { redirect_to pgs_url, notice: 'Pg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pg
      @pg = Pg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pg_params
      params.fetch(:pg, {}).permit(:pg_name, :address, :state_id, :city_id, :area_id, :pin_code, :normal_bed_price, :ac_bed_price)
    end
end
