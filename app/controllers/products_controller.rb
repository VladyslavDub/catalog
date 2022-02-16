class ProductsController < ApplicationController
  include OrderProducts

  def index
    @category = Category.find(params[:category_id]) if params[:category_id]
    @maker = Maker.find(params[:maker_id]) if params[:maker_id]

    @products = Product.all

    @products = @products.where(category: @category) if @category
    @products = @products.where(maker: @maker)if @maker

    @products = @products.with_attached_image.includes(:category,:maker)

    @products = order_products(@products)

    @categories = Category.not_blank.order(products_count: :desc)
    @makers = Maker.all.order(:name)
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category

    @order_by_click = OrderByClick.new(product: @product)
  end
end