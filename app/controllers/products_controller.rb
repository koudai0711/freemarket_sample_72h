class ProductsController < ApplicationController
  def show
  end

  def new
    @product = Product.new
  end

end
