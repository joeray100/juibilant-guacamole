class PlantsController < ApplicationController
  def destroy
    plot = Plot.find(params[:plot_id])
    remove_plant = plot.plants.delete(Plant.find(params[:id]))
    redirect_to "/plots"
  end
end
