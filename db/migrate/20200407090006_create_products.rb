class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,           null: false
      t.text       :description,    null: false
      t.string     :brand
      t.string     :status,         null: false
      t.string     :size,           null: false
      t.string     :shipping_cost,  null: false
      t.integer    :prefecture_id,  null: false
      t.string     :shipping_days,  null: false
      t.string     :price,          null: false
      t.string     :buyer_id
      t.string     :saler_id
      # t.references :user         , null: false, foreign_key: true
      t.timestamps
    end
  end
end
