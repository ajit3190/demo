class ServicesController < ApplicationController
  def index
    @services = Service.all
    @categories = Category.all
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end
  end

  def new
    @service = Service.new
    authorize @service
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end   
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      authorize @service
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @services = Service.where(:category_id => params[:id].to_i)
    if current_user.present?
    @cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    end 
  end

  def destroy
    @service = Service.find(params[:id])
      authorize @service
    if @service.destroy
      redirect_to services_path
    else
      flash[:alert] = "Error Deleting Product"
    end
  end

  def get_service
    # binding.pry
    @service = Service.find(params[:id])
    respond_to do |format|
      format.html
      format.js
     end
  end

  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      # @services = Service.all.where("lower(name) LIKE :search", search: @parameter) 
      @results = Service.all.where("lower(title) LIKE :search", search: "%#{@parameter}%") 
    end  
  end

  private

  def service_params
    params.require(:service).permit(:title, :detail, :price, :image, :category_id)
  end
end
