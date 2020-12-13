class TransactionsController < ApplicationController

    before_action :authenticate_user!
    before_action :check_cart!

    def new
    end

    def create
      current_user.purchase_cart_products!
      flash[:notice] = "Congratulations! We'll try to get you your items as soon as possible!"
      redirect_to root_url
    end


    private

      def check_cart!
        if current_user.get_cart_products_with_qty.blank?
          redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
        end
      end

end
