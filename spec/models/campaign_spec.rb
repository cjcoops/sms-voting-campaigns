require 'rails_helper'

describe Campaign do

  it { is_expected.to have_many :votes }

  let!(:campaign) {Campaign.create(name: "ssss_uk_02A")}
  let(:vote_1) {campaign.votes.create(epoch_time: 1168122971, validity: "during", choice: "Mark")}
  let(:vote_2) {campaign.votes.create(epoch_time: 1168122972, validity: "during", choice: "Gemma")}
  let(:vote_3) {campaign.votes.create(epoch_time: 1168122971, validity: "during", choice: "Mark")}
  let(:vote_pre) {campaign.votes.create(epoch_time: 1168122973, validity: "pre", choice: "Mark")}
  let(:vote_post) {campaign.votes.create(epoch_time: 1168122974, validity: "post", choice: "Gemma")}

  describe '#scores' do
    it "returns a hashmap of choices and scores" do
      vote_1
      vote_2
      vote_3
      results = { "Mark" => 2,
                  "Gemma" => 1 }
      expect(campaign.scores).to eq(results)
    end

    it "does not count votes with a validity of pre" do
      vote_1
      vote_pre
      results = { "Mark" => 1,
                  "Sent but not counted" => 1 }
      expect(campaign.scores).to eq(results)
    end

    it "does not count votes with a validity of pre" do
      vote_2
      vote_pre
      vote_post
      results = { "Gemma" => 1,
                  "Sent but not counted" => 2 }
      expect(campaign.scores).to eq(results)
    end
  end

end
