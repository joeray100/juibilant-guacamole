class Garden < ApplicationRecord
  has_many :plots
  has_many :plot_plants, through: :plots
  has_many :plants, through: :plot_plants

  def unique_and_ordered_plants
    plants.select('plants.*').where('days_to_harvest < ?', 100).distinct
  end
end
