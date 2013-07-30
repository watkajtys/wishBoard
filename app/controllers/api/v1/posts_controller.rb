class Api::V1::PostsController < ApplicationController
   respond_to :json

   def index
      @posts = Post.order_by(:id => :desc).page(params[:page]).per(25)
      respond_with @posts
   end

   def create
      @post = Post.create(params[:post])
      respond_with @post, location: "/"
   end
end