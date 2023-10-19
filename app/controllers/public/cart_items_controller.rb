class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!
    
    def index
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @total_price = 0;
    end
    
    def create
        current_cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: cart_items_params[:item_id])
        if current_cart_item
            # すでにカート内に同アイテムが存在する場合
            current_cart_item.update(
                amount: current_cart_item.amount.to_i + cart_items_params[:amount].to_i
            )
        else
            # カート内に同アイテムが存在しない場合
            cart_item = CartItem.new(cart_items_params)
            cart_item.customer_id = current_customer.id
            cart_item.save
        end
        redirect_to cart_items_path, notice: "#{Item.find(cart_items_params[:item_id]).name}を#{cart_items_params[:amount]}個カートに追加しました。"
    end

    def update
        cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
        if cart_item.amount.to_i == params[:cart_item][:amount].to_i
            # 同じ数なら
            redirect_back fallback_location: root_path, alert: "#{cart_item.item.name}の数量が#{cart_item.amount}個のまま変化がありません。"
        else
            # 数が変更されているなら
            cart_item.update(amount: params[:cart_item][:amount])
            if cart_item.amount <= 0
                cart_item.destroy
            end
            redirect_back fallback_location: root_path, notice: "#{cart_item.item.name}を#{cart_item.amount}個に変更しました。"
        end
    end

    def destroy
        cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:id])
        cart_item.destroy
        redirect_back fallback_location: root_path, notice: "#{cart_item.item.name}を削除しました。"
    end

    def destroy_all
        cart_items = CartItem.where(customer_id: current_customer.id)
        cart_items.each do |cart_item|
            cart_item.destroy
        end
        redirect_back fallback_location: root_path, notice: "カートを空にしました。"
    end
    
    private

    def cart_items_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
end
