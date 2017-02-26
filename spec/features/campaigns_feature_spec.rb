require 'rails_helper'

feature 'campaigns' do

  let!(:campaign_1) {Campaign.create(name: "ssss_uk_02A")}
  let!(:campaign_2) {Campaign.create(name: "ssss_uk_01B")}

  scenario 'show all campaigns' do
    visit('/')
    expect(page).to have_css('h1', text: "Campaigns")
    expect(page).to have_css('h3', text: "ssss_uk_02A")
    expect(page).to have_css('h3', text: "ssss_uk_01B")
  end

  scenario 'viewing a campaign page' do
    visit('/')
    click_link('ssss_uk_02A')
    expect(current_path).to eq "/campaigns/#{campaign_1.id}"
    expect(page).to have_css('h1', text: "ssss_uk_02A")
  end

end
