class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

  def index
    @orders = current_admin.orders
  end

  def destroy
  	order = Order.find_by_id(params[:id])
  	order.update_attribute(:cancel, true)
	flash[:notice] = "Order got cancelled!"
	UserMailer.with(user: current_admin.email).cancel_email
	redirect_to admin_orders_path
  end

end
