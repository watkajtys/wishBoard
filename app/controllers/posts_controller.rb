class PostsController < ApplicationController

   def new
      @post = Post.new
   end

   def create
      @post = Post.new params[:post]
      if @post.save
         redirect_to [:root]
      end
   end

end
