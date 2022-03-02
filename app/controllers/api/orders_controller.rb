class Api::OrdersController < ApplicationController
  def create
    order = Order.create(user: current_user)
    product = Product.find(params[:product_id])
    order.items.create(product: product)

    render json: { message: 'Your order was created...' }, status: 201
  end
end
