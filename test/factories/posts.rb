# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
   prepend "I wish"
   entry "upon a star..."
   color "#F3F2F2"
  end
end