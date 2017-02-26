require 'rails_helper'

feature 'campaigns' do
  before do
    campaign = Campaign.create(name: "ssss_uk_02A")
    campaign = Campaign.create(name: "ssss_uk_01B")
  end

  scenario 'show all campaigns' do
    visit('/campaigns')
    expect(page).to have_css('h1', text: "Campaigns")
    expect(page).to have_css('h3', text: "ssss_uk_02A")
    expect(page).to have_css('h3', text: "ssss_uk_01B")
  end

end
