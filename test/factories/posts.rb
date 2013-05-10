# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
   prepend "I wish"
   entry "upon a star..."
   color "#f5989d"
   tweeted false
  end
end
