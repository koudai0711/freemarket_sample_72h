class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end
end
