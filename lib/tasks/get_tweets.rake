require 'twitter_getter'

namespace :data do
  desc "Fetch Tweets to Database"
  task :fetch_tweets => :environment do
    TwitterGetter::TweetScraper.scrape_tweets
  end
end