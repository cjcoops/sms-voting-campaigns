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
To import SMS data into the database:

(This assumes you are using zsh. If using bash you may not need `\` before the square brackets.)
```
$ bin/rake votes:import\["/path/to/votes.txt"\]
```
Start the server with `$ bin/rails s` then visit `localhost:3000` in the browser.

To run the tests run `$ rspec`.
Approach
----------
1. I started by breaking the spec down into user stories and drew simple wireframes for the views. I broke the task down into two distinct parts - the Rails app and database, and then the script for importing data.
2. For the first part, the user stories guided me into deciding that I should have a Campaigns class which has a 'has many' relationship with Votes. This led me to decide on using postgres as it is a relational database.
3. I started by writing a feature test for a user viewing a list of Campaigns and then viewing a single campaign page. This guided me into creating the Campaign model, routes and views.
4. I then created the Votes model with attributes based on the required information for a 'well formed line'. I then test drove the association with a Campaign and some data validation for the Vote.
5. Displaying the scores could have been done in many ways but after considering a few I decided the simplest was to test drive the creation of a `scores` method for Campaign. This would analyse the votes data relating to that campaign and return a hashmap of candidates to scores. This hash could then be extended to add the votes sent but not counted. The hash could then be accessed and displayed nicely in the view.
6. For creating the script, I decided on creating a rake task as I had used them to automate processes previously and I knew that they were an easy way to open a connection with the database and add new items.
7. I then looked up ways of getting and breaking down data from a textfile and played around with this in pry until I figured out what my script would need to do. I used a sample version of the votes.txt which had only 5 'well formed' lines and played around with this in the rake file and then manually checked that this data was getting into the database correctly and also
