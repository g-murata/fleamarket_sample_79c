class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.string :address_last_name, null: false
      t.string :address_first_name, null: false
      t.string :address_last_name_kana, null: false
      t.string :address_first_name_kana, null: false
      t.integer :zip_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building_name
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :user_addresses, :phone_number, unique: true
  end
end
