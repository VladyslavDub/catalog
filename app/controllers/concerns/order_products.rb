module OrderProducts
    extend ActiveSupport::Concern

    included do
        before_action :set_sort, only: [:index,:show]
    end

    def order_products(products)
      case @sort
      when "name"
          products.order(name: :desc)
      when "price"
          products.order(price: :desc)
      when "chip price"
          products.order(:price)
      else
          products.order(name: :desc)
      end
    end

    private

    def set_sort
        @sort = params[:sort] if params[:sort].present? && AVAILIBLE_SORT.include?(params[:sort])
    end
end