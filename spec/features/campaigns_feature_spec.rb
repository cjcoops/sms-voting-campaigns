require 'rails_helper'

feature 'campaigns' do
  before do
    campaign = Campaign.create(name: "ssss_uk_02A")
  end

  scenario 'show all campaigns' do
    visit('/index')
    expect(page).to have_css('h1', text: "Campaigns")
    expect(page).to have_content("ssss_uk_02A")
  end

end
