class ProductsController < ApplicationController

  def index
  end
  
  def show
  end

  def new
    @product = Product.new
  end

end
