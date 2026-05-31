class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = policy_scope(Product)
    render json: @products
  end

  def show
    authorize @product
    render json: @product
  end

  def create
    @product = current_user.products.build(product_params)

    authorize @product

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @product

    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors
    end
  end

  def destroy
    authorize @product
    @product.destroy
    render json: { message: "Deleted" }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end