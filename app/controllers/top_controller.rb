class TopController < ApplicationController
  def index
    @product = Product.all
  end
end
