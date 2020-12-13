class Api::V1::ProductsController
  def index
    @products = Product.all
    render json: @products
  end

end
