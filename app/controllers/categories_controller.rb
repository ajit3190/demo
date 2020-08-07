class CategoriesController < ApplicationController
  def index
  	@categories = Category.all
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end   
  end

  def new
  	@category = Category.new
    authorize @category
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end
  end

  def create
  	@category = Category.new(cat_params)
  	if @category.save
      authorize @category
  		redirect_to categories_path
  	else
  		flash[:notice] = "Error While creating Category"
  	end
  end

  def destroy
    @category = Category.find(params[:id])
      authorize @category
    if @category.destroy
      redirect_to categories_path
    else
      flash[:alert] = "Error Deleting category"
    end
  end

  private

  def cat_params
  	params.require(:category).permit(:name, :image)
  end
end
