require 'test_helper'

class PostTest < ActiveSupport::TestCase

   test "an entry exists" do 
      post = FactoryGirl.build(:post, entry: nil)

      assert_false post.save
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
end
