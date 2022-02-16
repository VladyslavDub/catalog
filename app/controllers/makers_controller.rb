class MakersController < ApplicationController
    def show
      @products = maker.products.with_attached_image
    end
  
    private
  
    def maker
      @maker ||= Maker.find(params[:id])
    end
  end