task :tweet => :environment do
   Post.tweet_untweeted
end