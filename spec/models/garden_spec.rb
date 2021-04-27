require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plot_plants).through(:plots) }
    it { should have_many(:plants).through(:plot_plants) }
  end

  before :each do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden_2 = Garden.create!(name: "Denver local Garden", organic: true)

    @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @garden_2.plots.create!(number: 34, size: "Large", direction: "East")

    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = @plot_1.plants.create!(name: "Onions", description: "Prefers wet soil.", days_to_harvest: 150)
    @plant_3 = @plot_1.plants.create!(name: "Watermelon", description: "Prefers dry soil.", days_to_harvest: 50)
    @plant_4 = @plot_2.plants.create!(name: "Chilis", description: "Prefers dry weather.", days_to_harvest: 75)
    @plant_5 = @plot_2.plants.create!(name: "Carrots", description: "Prefers rainy weather.", days_to_harvest: 125)
    @plant_6 = @plot_2.plants.create!(name: "Mint", description: "Prefers topical conditions.", days_to_harvest: 60)
  end

  describe 'instance methods' do
    it '#unique_and_ordered_plants' do
      actual = @garden_1.unique_and_ordered_plants.map do |plant|
        plant
      end
      expected = [@plant_1, @plant_3]
      not_expected = [@plant_1, @plant_3, @plant_3]

      expect(actual).to eq(expected)
      expect(actual).to_not eq(not_expected)
    end
  end
end
