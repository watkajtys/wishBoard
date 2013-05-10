require 'test_helper'

class PostTest < ActiveSupport::TestCase

   test "an entry exists" do 
      post = FactoryGirl.build(:post, entry: nil)

      assert_false post.save
   end

   test "an entry cannot be a blank string" do 
      post = FactoryGirl.build(:post, entry: '')

      assert_false post.save
   end

   test "an entry cannot be less than three characters long" do 
      post = FactoryGirl.build(:post, entry: '12')
      assert_false post.save
   end

   test "an entry cannot be more than 160 characters long" do
      post = FactoryGirl.build(:post, entry: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus. This is still short. AH!")
      assert_false post.save
   end

   test "an entry that is 160 characters or less is valid" do 
      post = FactoryGirl.build(:post, entry: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus. This is still short." )
      assert_true post.save
   end

   test "prepend includes valid entry" do 

      post = FactoryGirl.build(:post, prepend: 'blah')
      assert_false post.save
   end

   test "I wish prepend is valid" do 

      post = FactoryGirl.build(:post, prepend: 'I wish')
      assert_true post.save
   end

   test "I want prepend is valid" do 
      post = FactoryGirl.build(:post, prepend: 'I want')
      assert_true post.save
   end

   test "I miss prepend is valid" do 
      post = FactoryGirl.build(:post, prepend: 'I miss')
      assert_true post.save
   end

   test "There must be a color value on each post" do 
      post = FactoryGirl.build(:post, color: nil)
      assert_false post.save
   end

   test "Color cannot be outside of approved list (dictated in post.rb)" do
      post = FactoryGirl.build(:post, color: "Apples")
      assert_false post.save
   end

   test "Approved color (#fff799) allows save" do
      post = FactoryGirl.build(:post, color: '#fff799')
      assert_true post.save
   end

   test ":tweeted is not blank" do 
      post = FactoryGirl.build(:post, tweeted: nil)
      assert_false post.save
   end

   test ":tweeted can only be true or false" do
      post = FactoryGirl.build(:post, tweeted: 'apples')
      assert_false post.save
   end

   test ":tweeted defaults to false" do
      post = FactoryGirl.build(:post)
      assert_equal false, post.tweeted
   end

   test "full text generates the prepend plus the entry" do
      post = FactoryGirl.build(:post)
      assert_equal "I wish upon a star...", post.fulltext
   end

end
