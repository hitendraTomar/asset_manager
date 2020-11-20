class CommecialUnitsController < ApplicationController
  before_action :set_commecial_unit, only: [:show, :edit, :update, :destroy, :buy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /houses
  # GET /houses.json
  def index
    @commecial_units = CommecialUnit.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @commecial_unit = CommecialUnit.new
  end

  # GET /houses/1/edit
  def edit
  end

  def buy
    VeryLongTaskJob.perform_later('CommecialUnit', @commecial_unit.id, current_user.id)
    redirect_to root_url
  end

  # POST /houses
  # POST /houses.json
  def create
    @commecial_unit = CommecialUnit.new(commecial_unit_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @commecial_unit.save
        format.html { redirect_to @commecial_unit, notice: 'Commecial Units was successfully created.' }
        format.json { render :show, status: :created, location: @commecial_unit }
      else
        format.html { render :new }
        format.json { render json: @commecial_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @commecial_unit.update(commecial_unit_params)
        format.html { redirect_to @commecial_unit, notice: 'commecial_unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @commecial_unit }
      else
        format.html { render :edit }
        format.json { render json: @commecial_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @commecial_unit.destroy
    respond_to do |format|
      format.html { redirect_to commecial_units_url, notice: 'commecial_units was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commecial_unit
      @commecial_unit = CommecialUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commecial_unit_params
      params.require(:commecial_unit).permit(:owner, :address, :shops, :sqmt, :parking, :price)
    end
end
