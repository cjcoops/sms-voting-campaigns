require 'rails_helper'

feature 'Campaigns' do

  let!(:campaign_1) {Campaign.create(name: "ssss_uk_02A")}
  let!(:campaign_2) {Campaign.create(name: "ssss_uk_01B")}

  let!(:vote_1) {campaign_1.votes.create(epoch_time: 1168122971, validity: "during", choice: "Mark")}
  let!(:vote_2) {campaign_1.votes.create(epoch_time: 1168122972, validity: "during", choice: "Gemma")}
  let!(:vote_3) {campaign_1.votes.create(epoch_time: 1168122971, validity: "during", choice: "Mark")}
  let!(:vote_pre) {campaign_1.votes.create(epoch_time: 1168122973, validity: "pre", choice: "Mark")}
  let!(:vote_post) {campaign_1.votes.create(epoch_time: 1168122974, validity: "post", choice: "Gemma")}

  scenario 'index page shows a list of campaigns' do
    visit('/')
    expect(page).to have_css('h1', text: "Campaigns")
    expect(page).to have_css('h3', text: "ssss_uk_02A")
    expect(page).to have_css('h3', text: "ssss_uk_01B")
  end

  scenario 'clicking on a campaign takes user to campaign page' do
    visit('/')
    click_link('ssss_uk_02A')
    expect(current_path).to eq "/campaigns/#{campaign_1.id}"
    expect(page).to have_css('h1', text: "ssss_uk_02A")
    expect(page).to have_css('li', text: "Mark: 2")
    expect(page).to have_css('li', text: "Gemma: 1")
    expect(page).to have_css('li', text: "Sent but not counted: 2")
  end

  scenario 'campaign page lists the scores for each candidate' do
    visit("/campaigns/#{campaign_1.id}")
    expect(page).to have_css('h1', text: "ssss_uk_02A")
    expect(page).to have_css('li', text: "Mark: 2")
    expect(page).to have_css('li', text: "Gemma: 1")
    expect(page).to have_css('li', text: "Sent but not counted: 2")
  end
end
