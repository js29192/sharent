class PgsController < ApplicationController
  before_action :set_pg, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pgs
  # GET /pgs.json
  def index
    @pgs = current_user.pgs
  end

  # GET /pgs/1
  # GET /pgs/1.json
  def show
    check_pg_user
    authorize! :show, @pg
  end

  # GET /pgs/new
  def new
    @pg = current_user.pgs.build
    authorize! :new, @pg
  end

  # GET /pgs/1/edit
  def edit
    check_pg_user
    authorize! :edit, @pg
  end

  # POST /pgs
  # POST /pgs.json
  def create
    @pg = current_user.pgs.build(pg_params)
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
    authorize! :destroy, @pg
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

    def check_pg_user
      if @pg.user_id != current_user.id
        redirect_to root_path, alert: "You are not the owner of this PG."
      end
    end
end
