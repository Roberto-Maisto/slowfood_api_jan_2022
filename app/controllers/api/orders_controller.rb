class Api::OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
    order.items.create(product: product)
    render json: { message: 'Your order was created...' }, status: 201
  end

  def update
    order = Order.find(params[:id])
    product = Product.find(params[:product_id])
    order.items.create(product: product)
    render json: { message: 'Your order was updated...' }
  end
end
