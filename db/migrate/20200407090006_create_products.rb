class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,           null: false
      t.string     :price,          null: false
      t.string     :description,    null: false
      t.string     :size,           null: false
      t.integer    :brand_id,       null: false, foreign_key: true
      t.integer    :category_id,    null: false, foreign_key: true
      t.string     :status,         null: false
      t.string     :prefecture,     null: false
      t.string     :shipping_cost,  null: false
      t.string     :shipping_days,  null: false
      t.integer    :shipping_id,    null: false, foreign_key: true
      t.integer    :user_id,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
