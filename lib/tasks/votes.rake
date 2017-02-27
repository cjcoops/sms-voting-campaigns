namespace :votes do
  desc "imports log file data from .txt file"
  task :import, [:filepath] => [:environment] do |t, args|
    file = args[:filepath]

    lines =  File.readlines(file)

    lines.each do |line|
      line = line.encode('utf-8', 'binary', :invalid => :replace, :undef => :replace)

      if (line =~ /^VOTE \d+ Campaign:\w+ Validity:[a-zA-Z]* Choice:\w+ CONN/)
        epoch_time = line.split(' ')[1]
        campaign_name = line.split(' ')[2].split(':')[1]
        validity = line.split(' ')[3].split(':')[1]
        choice = line.split(' ')[4].split(':')[1]

        campaign = Campaign.where(name: campaign_name).first_or_create
        campaign.votes.create(epoch_time: epoch_time, validity: validity, choice: choice)
      end
    end
  end
end
