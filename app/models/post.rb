class Post
  include Mongoid::Document

  field :prepend
  field :entry
  field :color

  validates_inclusion_of :prepend, in: ["I wish", "I want", "I miss"]
  validates_presence_of :entry
  validates :entry, :length => {:in => 3..160}

end
