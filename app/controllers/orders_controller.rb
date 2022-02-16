class OrdersController < ApplicationController
    def create
      if OrderByClick.create(order_by_click_params)
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
    def order_by_click_params
      params.require(:order_by_click).permit(:phone,:product_id)
    end
  end