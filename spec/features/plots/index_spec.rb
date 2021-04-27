require 'rails_helper'

RSpec.describe 'Plot Index Page' do
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
    visit "/plots"
  end

  it 'I see a list of all plot numbers' do
    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
  end

  it "under each plot number I see names of all that plot's plants" do
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
  end

  it "Next to each plant I see a link to remove that plant from that plot" do
    expect(page).to have_link("Delete", href: "/plots/#{@plot_1.id}/plants/#{@plant_1.id}")
  end

  it "I can delete a plots plant" do
    click_link 'Delete', match: :first
    
    expect(current_path).to eq("/plots")
    expect(page).to_not have_content(@plant_1.name)
    expect(page).to_not have_link('Delete',count: 3)
  end
  # When I click on that link
  # I'm returned to the plots index page
  # And I no longer see that plant listed under that plot
  # (Note: you should not destroy the plant record entirely)
end
