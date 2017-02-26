require 'rails_helper'

describe Campaign do

  it { is_expected.to have_many :votes }

  let!(:campaign) {Campaign.create(name: "ssss_uk_02A")}
  let!(:vote_1) {campaign.votes.create(epoch_time: 1168122971, validity: "during", choice: "Mark")}
  let!(:vote_2) {campaign.votes.create(epoch_time: 1168122972, validity: "during", choice: "Gemma")}
  let!(:vote_3) {campaign.votes.create(epoch_time: 1168122971, validity: "during", choice: "Mark")}

  describe '#scores' do
    it "returns a hashmap of choices and scores" do
      results = { "Mark" => 2,
                  "Gemma" => 1 }

      expect(campaign.scores).to eq(results)
    end
  end

end
