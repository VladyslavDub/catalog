class PagesController < ApplicationController
    def index
      @products = Product.limit(8).with_attached_image
    end
  end