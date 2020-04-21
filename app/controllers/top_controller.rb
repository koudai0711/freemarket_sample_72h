class TopController < ApplicationController
  def index
    @products = Product.all.order('created_at DESC')
    @images = Image.where(product_id: @products.ids)
  end


end
