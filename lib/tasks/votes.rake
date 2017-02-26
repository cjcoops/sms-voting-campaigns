namespace :votes do
  desc "imports log file data from .txt file"
  task import: :environment do
    file = "/Users/chriscooper/Desktop/votes_short.txt"

    lines =  File.readlines(file)

    lines.each do |line|
      epoch_time = line.split(' ')[1]
      campaign_name = line.split(' ')[2].split(':')[1]
      validity = line.split(' ')[3].split(':')[1]
      choice = line.split(' ')[4].split(':')[1]

      campaign = Campaign.first_or_create(name: campaign_name)
      campaign.votes.create(epoch_time: epoch_time, validity: validity, choice: choice)
    end
  end
end
