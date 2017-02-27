

# SMS Voting Campaigns

My solution to the following task:

Create a rails application to show the results for TV SMS voting campaigns,
derived from log data held in a text file. Deliverables:

* Rails app and database to hold the data
* Basic web front tend to view list of campaigns and their results
* Command line script that will import the log file data into the application
* Description of my approach - see below

Usage
---------
To use make sure that you first have Rails and Postgres installed.

Clone the repo and install dependencies:
```
$ git clone https://github.com/cjcoops/sms-voting-campaigns.git
$ cd sms-voting-campaigns
$ bundle install
```
Create and migrate development and test databases:
```
$ bin/rake db:create
$ bin/rake db:create RAILS_ENV=test
$ bin/rake db:migrate
$ bin/rake db:migrate RAILS_ENV=test
```
To import SMS data into the database. This assumes you are using zsh. If using bash you may not need `\` before the square brackets.
```
$ bin/rake votes:import\["/path/to/votes.txt"\]
```
To run the tests:
```
$ rspec
```
Approach
----------
