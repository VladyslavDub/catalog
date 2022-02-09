class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, default: "", null: false
      t.string :meta_title, default: "", null: false
      t.string :meta_description, default: "", null: false
      t.string :keywords, default: "", null: false
      t.bigint :price, null: false
      t.integer :category_id, null: false
      t.integer :maker_id
      t.boolean :available, default: false, null: false

      t.timestamps
    end
  end
end
