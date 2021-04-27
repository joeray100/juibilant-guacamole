require 'rails_helper'

RSpec.describe 'Gardens Show Page' do
  before :each do
    @garden_1 = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot_1 = @garden_1.plots.create!(number: 25, size: "Large", direction: "East")

    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = @plot_1.plants.create!(name: "Onions", description: "Prefers wet soil.", days_to_harvest: 150)
    @plant_3 = @plot_1.plants.create!(name: "Watermelon", description: "Prefers dry soil.", days_to_harvest: 50)

    @garden_2 = Garden.create!(name: "Denver local Garden", organic: true)

    @plot_2 = @garden_2.plots.create!(number: 34, size: "Large", direction: "East")

    @plant_4 = @plot_2.plants.create!(name: "Chilis", description: "Prefers dry weather.", days_to_harvest: 75)
    @plant_5 = @plot_2.plants.create!(name: "Carrots", description: "Prefers rainy weather.", days_to_harvest: 125)
    @plant_6 = @plot_2.plants.create!(name: "Mint", description: "Prefers topical conditions.", days_to_harvest: 60)
    visit "/gardens/#{@garden_1.id}"
  end

  it "I see the garden's 'name' and 'organic' attributes" do
    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@garden_1.organic)
  end

  it "I see a list of plants that do not take longer than 100 days to harvest" do
    expect(page).to_not  have_content(@plant_2.name)
  end

  it "I see a list of unique plants that are included in that garden's plots" do
    expect(page).to have_content(@plant_1.name, count: 1)
    expect(page).to have_content(@plant_3.name, count: 1)
  end

end
