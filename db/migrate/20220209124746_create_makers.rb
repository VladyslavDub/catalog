class CreateMakers < ActiveRecord::Migration[6.1]
  def change
    create_table :makers do |t|
      t.string :name, null: false
      t.text :description, default: "", null: false
      t.string :meta_title, default: "", null: false
      t.string :meta_description, default: "", null: false
      t.string :keywords, default: "", null: false
      t.integer :products_count, default: 0, null: false

      t.timestamps
    end
  end
end
