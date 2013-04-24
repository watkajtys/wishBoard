class Post
   include Mongoid::Document

   field :prepend
   field :entry
   field :color

   validates_inclusion_of :prepend, in: ["I wish", "I want", "I miss"]
   validates_presence_of :entry
   validates :entry, :length => {:in => 3..160}
   validates_presence_of :color
   validates_inclusion_of :color, in: ['#f3f2f2','#f5989d', '#fff799', '#bd8cbf', '#fdbd89', '#79bcde', '#82ca89']

end
