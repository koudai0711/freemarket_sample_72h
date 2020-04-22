class ProductsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]
  
  def new
    @product = Product.new
    @product.images.new
    @address = Prefecture.all
    
  end

  def create
    # binding.pry
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

  def buy
    @product = Product.find(params[:id])
    card = Card.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    Payjp::Charge.create(
    :amount => @product.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
    )
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
  end

  def show
    @image = Image.where(product_id: params[:id])
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :brand, :status, :size, :shipping_cost, :prefecture_id, :shipping_days, :buyer_id, :saler_id, :category_id, images_attributes: [:src])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
