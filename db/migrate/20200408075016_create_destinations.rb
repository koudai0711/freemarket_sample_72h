class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer    :user_id,             null: false, foreign_key: true
      t.string     :last_name,           null: false
      t.string     :first_name,          null: false
      t.string     :last_name_kana,      null: false
      t.string     :first_name_kana,     null: false
      t.timestamps
    end
  end
end
