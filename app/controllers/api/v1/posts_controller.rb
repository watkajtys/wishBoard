class Api::V1::PostsController < ApplicationController
   respond_to :json

   def index
      @posts = Post.order_by(:id => :desc).page(params[:page]).per(15)
      respond_with @posts
   end

   def create
      @post = Post.new params[:post]
      if @post.save
         redirect_to [:root], notice: "Your wish has been added!" 
      else
         redirect_to [:root], alert: @post.errors.full_messages
      end
      respond_with @post, location: "/"
   end
end