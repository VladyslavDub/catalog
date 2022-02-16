class CreateOrderByClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :order_by_clicks do |t|
      t.string :phone
      t.integer :product_id

      t.timestamps
    end
  end
end
