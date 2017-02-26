class Vote < ApplicationRecord

  validates :choice, presence: true

end
