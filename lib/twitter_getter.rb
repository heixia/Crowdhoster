require 'twitter'

module TwitterGetter

  class ConfigurationTasks

    def self.configure_twitter

    Twitter.configure do |config|
      config.consumer_key = "EAhY8dHmZgMHrcztSxdg"
      config.consumer_secret = "1ddwMrOiTPAHSMCaUAZMaDUyjvvqIYpEqQlqK8R13c"
      config.oauth_token = "15913837-Iy0DKKHbwqlq3hFk0z660nd6gyz8Zsu0XCCMpLLEv"
      config.oauth_token_secret = "1ccl3H19nwFuZCYLbN2c74OWggw8LeW1iLSpeS4563g"
      end
    end
  end

  class TweetScraper

    def self.scrape_tweets_for_bootcamp(bootcamp)
      begin
        puts "scraping tweets for #{bootcamp.name}"
        Twitter.user_timeline(bootcamp.twitter_handle, {:exclude_replies => true, :include_rts => false}).each do |bootcamptweet|
        tweet=bootcamp.tweets.new
        tweet.status=bootcamptweet.text
        tweet.save
        end
      rescue
        puts "no tweets for #{bootcamp.name}"
        tweet=bootcamp.tweets.new
        tweet.status="Sorry, No Tweets for this bootcamp"
        tweet.save
      end
    end

    # def self.get_counts_for_bootcamp(bootcamp)
    #   user=Twitter.user(student.twitter_handle)
    #   student.total_tweets=user.statuses_count
    #   student.followers=user.friends_count
    #   student.save!
    #   puts "#{student.username} saved: #{student.total_tweets}"
    # end
    
    def self.scrape_tweets_for_each_bootcamp
      Bootcamp.all.each do |bootcamp|
        scrape_tweets_for_bootcamp(bootcamp)
        # get_counts_for_user(bootcamp)
      end
    end

    def self.scrape_tweets
      ConfigurationTasks.configure_twitter
      scrape_tweets_for_each_bootcamp
    end

  end

end