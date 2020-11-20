class ComplexBuildingsController < ApplicationController
  before_action :set_complex_building, only: [:show, :edit, :update, :destroy, :buy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /houses
  # GET /houses.json
  def index
    @complex_buildings = ComplexBuilding.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @complex_building = ComplexBuilding.new
  end

  # GET /houses/1/edit
  def edit
  end

  def buy
    VeryLongTaskJob.perform_later('ComplexBuilding', @complex_building.id, current_user.id)
    redirect_to root_url
  end

  # POST /houses
  # POST /houses.json
  def create
    @complex_building = ComplexBuilding.new(complex_building_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @complex_building.save
        format.html { redirect_to @complex_building, notice: 'Complex Building was successfully created.' }
        format.json { render :show, status: :created, location: @complex_building }
      else
        format.html { render :new }
        format.json { render json: @complex_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @complex_building.update(complex_building_params)
        format.html { redirect_to @complex_building, notice: 'complex_building was successfully updated.' }
        format.json { render :show, status: :ok, location: @complex_building }
      else
        format.html { render :edit }
        format.json { render json: @complex_building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @complex_building.destroy
    respond_to do |format|
      format.html { redirect_to complex_buildings_url, notice: 'complex_building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complex_building
      @complex_building = ComplexBuilding.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complex_building_params
      params.require(:complex_building).permit(:owner, :address, :units, :sqmt, :price)
    end
end
