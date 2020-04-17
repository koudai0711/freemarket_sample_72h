class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.timestamps

      :address_last_name
      :address_first_name
      :address_last_name_kana
      :address_first_name_kana
      :postal_code
      :prefecture
      :city
      :house_number
      :phone_number
    end
  end
end
