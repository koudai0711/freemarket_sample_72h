class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id,          null: false
      t.timestamps

      t.string :address_last_name,       null: false
      t.string :address_first_name,      null: false
      t.string :address_last_name_kana,  null: false
      t.string :address_first_name_kana, null: false
      t.string :postal_code,             null: false
      t.string :city,                    null: false
      t.string :house_number,            null: false
      t.string :building_name
      t.string :phone_number
      t.references :user, foreign_key: true
    end
  end
end
