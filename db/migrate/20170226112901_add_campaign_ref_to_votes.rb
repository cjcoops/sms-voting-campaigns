class AddCampaignRefToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :campaign, foreign_key: true
  end
end
