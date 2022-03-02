class Api::OrdersController < ApplicationController
  def create
    order = Order.create(user: current_user)
    product = Product.find(params[:product_id])
    binding.pry

  end
end
