class PostsController < ApplicationController

   def new
      @post = Post.new
   end

   def create
      @post = Post.new params[:post]
      if @post.save
         redirect_to [:root], notice: "Your wish has been added!" 
         Twitter.update(@post.fulltext)
      else
         redirect_to [:root], alert: @post.errors.full_messages
      end
   end

end
