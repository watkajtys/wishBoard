class WishesController < ApplicationController
   def new
      @wish = Wish.new
   end

   def create
      @wish = Wish.new params[:wish]
      if @wish.save
         redirect_to [:wishes]
      end
   end

   def index
      @wishes = Wish.all
   end
end
