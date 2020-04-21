class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  
  def new
    @product = Product.new
    @product.images.new
    @address = Prefecture.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.images.new
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
    else 
      redirect_to root_path
    end
  end

  def show
    @image = Image.where(product_id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :brand, :status, :size, :shipping_cost, :prefecture_id, :shipping_days, :buyer_id, :saler_id, images_attributes: [:src])
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
