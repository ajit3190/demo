class HomesController < ApplicationController
  def index
  	@users = User.all
  	@categories = Category.all
  	if current_user.present?
  		@cart = current_cart(current_user)
  	end
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end  	
  end
end
