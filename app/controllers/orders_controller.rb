class OrdersController < ApplicationController
  def create
    @teddy = Teddy.find(params[:teddy_id])
    order  = Order.create!(teddy_sku: @teddy.sku, amount: @teddy.price, state: 'pending')
    # redirect to orders/:id/payment path, which is the show page with a QR code
    redirect_to order_payment_path(order)
  end

  def show
    @order = Order.find(params[:id])
  end
end
