class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    
    if params[:order][:address_type] == "member_address"
        @order.name = current_customer.last_name + current_customer.first_name
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code
       
    elsif params[:order][:address_type] == "registered_address"
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        
    elsif params[:order][:address_type] == "new_address"
        address_new = current_customer.addresses.new(order_params)
        if !address_new.save 
        render :new
        end
    else
      redirect_to orders_new_path
    end
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order.payment_method = params[:order][:payment_method] 
    # if params[:order][:payment_method] == "credit_card"
    #   @payment_method = "クレジットカード"
    # else 
    #   @payment_method = "銀行振込"
    # end
  
  end
  
  def complete
  end
  
  def create
    # paramsは前画面のフォームから送られてきたデータ
    # Orderのレコードを作成
    order = Order.new #空のOrderのレコード作成
    order.address = params[:order][:address] #Orderに設定しているカラムに値を代入（address）
    order.name = params[:order][:name] #Orderに設定しているカラムに値を代入（name）
    order.postal_code = params[:order][:postal_code] #Orderに設定しているカラムに値を代入（postal_code）
    order.total_payment = params[:order][:total_payment] #Orderに設定しているカラムに値を代入（total_payment）
    order.payment_method = params[:order][:payment_method] #Orderに設定しているカラムに値を代入（payment_method）
    order.shipping_cost = 800 #Orderに設定しているカラムに値を代入（送料）
    order.status = 0 #Orderに設定しているカラムに値を代入（ステータス）
    order.customer_id = current_customer.id #Orderに設定しているカラムに値を代入（ログインしている顧客のID）
    order.save #Orderに設定しているカラムに値を代入(保存)
    
    cart_items = CartItem.where(customer_id: current_customer.id) # 全顧客カートからログイン中の顧客のカートを抽出
    cart_items.each do |cart_item| # 商品の種類ごとにループされる
      order_detail = OrderDetail.new
      order_detail.order_id = order.id 
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.item_price
      order_detail.amount = cart_item.amount
      order_detail.making_status = 0
      order_detail.save
      cart_item.destroy # カートを空にする処理
    end
    redirect_to complete_orders_path
  end
  
  def index
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
  
end  

