class UsersController < ApplicationController
  def index
  	@houses = House.all
    @complex_buildings = ComplexBuilding.all
    @commecial_units = CommecialUnit.all
  end
end
