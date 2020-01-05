class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.with_deleted
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
  end

  def new
    @order = Order.new
  end

  def confirmation
  end 

  def thanks
  end


  def create
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path, notice: '更新しました。'
    else
      render action: :show
    end
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:name,:address,:order_postal_code,:payment,:deleted_at,:order_status)
  end
end
