class Campaign < ApplicationRecord

   has_many :votes

   def scores
     results = Hash.new 0
     votes.each do |vote|
       add_vote_to_results_hash(results, vote)
     end
     results
   end

   private

   def add_vote_to_results_hash(results, vote)
     if vote.validity == "during"
       results[vote.choice] += 1
     else
       results["Sent but not counted"] += 1
     end
   end

end
