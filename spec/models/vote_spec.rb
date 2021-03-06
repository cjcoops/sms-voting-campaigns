require 'rails_helper'

describe Vote, type: :model do
  it 'vote is not valid if choice is not supplied' do
    vote = Vote.new(epoch_time: 1168122971, validity: "during")
    expect(vote).to have(1).error_on(:choice)
    expect(vote).not_to be_valid
  end
end
