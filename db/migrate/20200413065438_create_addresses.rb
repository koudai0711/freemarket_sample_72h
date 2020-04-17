class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.timestamps

      t.string :address_last_name,       null: false
      t.string :address_first_name,      null: false
      t.string :address_last_name_kana,  null: false
      t.string :address_first_name_kana, null: false
      t.string :postal_code,             null: false
      t.string :prefecture,              null: false
      t.string :city,                    null: false
      t.string :house_number
      t.string :phone_number
    end
  end
end
