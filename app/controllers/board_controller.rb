class BoardController < ApplicationController
   respond_to :json, :html

   def index
      @posts = Post.order_by(:id => :desc).page(params[:page]).per(1)
      @post = Post.new
      respond_with @posts
   end
end
