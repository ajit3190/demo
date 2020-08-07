class CartsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
  def index
    if current_user.present?
  	@cart = current_user.cart
  	@users = User.all
  	@cart_items = @cart.cart_items
    end
  end

  def create
    # binding.pry
  	if current_user.present?
      @cart = current_cart(current_user)
  		if @cart.cart_items.find_by_service_id(params[:service_dashboard_id]).blank?
  			@cart_items = @cart.cart_items.new(service_id: params[:service_dashboard_id])
  			if @cart_items.save
          redirect_back(fallback_location: services_path)
  			 	flash[:notice] = 'Item Added Successfully'
  			end
  		else
        redirect_back(fallback_location: services_path)
  			flash[:notice] = 'Item Already added'
  		end
  		respond_to do |format|
  			format.js{}
  		end
  	else
  		redirect_to new_user_session_path
      flash[:notice] = 'Please login first'
  	end
  end

  def destroy
  @cartitem = CartItem.find(params[:id])
    if @cartitem.destroy
      flash[:notice] = "Product deleted"
      redirect_to carts_path
    else
      flash[:alert] = "Error deleting product!"
    end
  end

end