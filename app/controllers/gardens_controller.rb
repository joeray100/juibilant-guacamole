class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plants = @garden.unique_and_ordered_plants
  end
end
