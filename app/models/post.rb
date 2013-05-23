class Post
   include Mongoid::Document

   field :prepend
   field :entry
   field :color, :default => "#f3f2f2"
   field :tweeted, :default => false

   validates_inclusion_of :tweeted, in: [true, false]
   validates_presence_of :tweeted
   validates_inclusion_of :prepend, in: ["I wish", "I want", "I miss"]
   validates_presence_of :entry
   validates :entry, :length => {:in => 3..120}
   validates_presence_of :color
   validates_inclusion_of :color, in: ['#f3f2f2','#f5989d', '#fff799', '#bd8cbf', '#fdbd89', '#79bcde', '#82ca89']

   def fulltext
      "#{prepend} #{entry}"
   end

   def self.tweet_untweeted
      Post.notTweeted.each do |p|
         Twitter.update(p.fulltext)
         p.tweeted = true
         p.save
      end
   end

   scope :notTweeted, where(tweeted: false)
end
