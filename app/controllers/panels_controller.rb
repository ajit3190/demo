class PanelsController < ApplicationController
  def index
  	@users = User.all
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end
  end

  def new
  	@user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
  	if @user.save
      authorize @user
  		redirect_to panels_path
  	else
  		flash[:notice] = "User Not Created"
  	end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if params[:format] == "1"
      @user.role_id = 2
      @user.save
      redirect_to panels_path
    else
      @user.role_id = 1
      @user.save
      redirect_to panels_path
    end
  end

  def destroy
  	@user = User.find(params[:id])
      authorize @user
  	if @user.destroy
  		redirect_to panels_path
  	else
  		flash[:notice] = "Error deleting User!!"
  	end
  end

  private

  def user_params
  	params.permit(:data)
  end
end
