class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create,]

  def show
  end

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

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
       redirect_to root_path
    else 
       redirect_to root_path
    end
  end

  def buy
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
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
    card = Card.where(user_id: current_user.id).first
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


  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :brand, :status, :shipping_cost, :prefecture_id, :shipping_days, :buyer_id, :saler_id, images_attributes: [:src])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
