class BoardController < ApplicationController
   def index
      @posts = Post.order_by(:id => :desc).page(params[:page])
      @post = Post.new
   end
end
