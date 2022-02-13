class CategoriesController < ApplicationController
    def show
      @products = category.products.with_attached_image
    end
  
    private
  
    def category
      @category ||= Category.find(params[:id])
    end
  end