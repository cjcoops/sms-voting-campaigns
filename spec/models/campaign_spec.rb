require 'rails_helper'

describe Campaign do

  it { is_expected.to have_many :votes }

end
