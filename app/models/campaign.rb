class Campaign < ApplicationRecord

   has_many :votes

   def scores
     results = Hash.new 0

     votes.each do |vote|
       results[vote.choice] += 1
     end

     results
   end

end
