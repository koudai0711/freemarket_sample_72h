class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer    :user_id,         null: false, foreign_key: true
      t.string     :post_code,       null: false
      t.string     :prefecture,      null: false
      t.string     :city,            null: false
      t.string     :address,         null: false
      t.string     :building_name,   null: false
      t.string     :phone_number,    null: false
      t.timestamps
    end
  end
end
