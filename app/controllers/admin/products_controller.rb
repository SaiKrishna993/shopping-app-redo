class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @products = current_admin.products.all
  end

  def show
    @product = find_product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.admin_id = current_admin.id
    if @product.save
      flash[:notice] = "Product added!"
      redirect_to admin_products_path
    else
      flash[:notice] = "Product can't be blank!"
      render 'admin/products/new'
    end
  end

  def edit
    @product = find_product
  end

  def update
    @product = find_product
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    Product.destroy(params[:id])
    flash[:notice] = "Product removed!"
    redirect_to admin_products_path
  end

  def find_product
    product = Product.find_by_id(params[:id])
    if product.present?
      if product.admin == current_admin
        product
      else
        flash[:notice] = "This Product do not belongs to you!"
        redirect_to admin_products_path
      end
    else
      flash[:notice] = "This Product do not belongs to you!"
      redirect_to admin_products_path
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

end
