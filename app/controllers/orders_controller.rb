class OrdersController < ApplicationController

before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def destroy
  	order = Order.find_by_id(params[:id])
  	order.update_attribute(:cancel, true)
  	flash[:notice] = "Order got cancelled!"
  	UserMailer.with(user: current_user.email).cancel_email
  	redirect_to orders_path
  end

end
