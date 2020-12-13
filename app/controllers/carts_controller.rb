class CartsController < ApplicationController

  before_action :authenticate_user!

  def show
    @cart_products_with_qty = current_user.get_cart_products_with_qty
    @cart_total = current_user.cart_total_price
  end

  def add
    if current_user.cart_count.zero?
      current_user.add_to_cart(params[:product_id])
    else
      admin_ids = current_user.get_cart_products_with_qty.map{|p| p.first.admin_id}
      product = Product.find(params[:product_id])
      if admin_ids.include? product.admin_id
        current_user.add_to_cart(params[:product_id])
      else
        flash[:notice] = "You can not add products from different shops"
      end
    end

    redirect_to cart_path
  end

  def remove
    current_user.remove_from_cart(params[:product_id])
    redirect_to cart_path
  end

  def removeone
    current_user.remove_one_from_cart(params[:product_id])
    redirect_to cart_path
  end

end
