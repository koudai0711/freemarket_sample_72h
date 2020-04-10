class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    product = Product.create(product_params)
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :size, :status, :prefecture, :shipping_cost, :shipping_days, :shipping_id)
  end
end
