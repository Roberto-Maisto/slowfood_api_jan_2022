class Api::OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]
  before_action :find_product, only: %i[create update]

  def create
    order = current_user.orders.create
    order.items.create(product: @product)
    render json: { message: 'Your order was created...' }, status: 201
  end

  def update
    order = Order.find(params[:id])
    order.items.create(product: @product)
    render json: { message: 'Your order was updated...' }
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end
end
