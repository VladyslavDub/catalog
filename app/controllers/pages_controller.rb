class PagesController < ApplicationController
    def index
      @category = Category.all.sample
      @products = Product.limit(8).with_attached_image
    end
  end