class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.references :brand, foreign_key: true
      t.integer :product_status, null: false
      t.integer :buyer_address, null: false #, foreign_key: true
      t.integer :prefecture, null: false
      t.integer :size, null: false 
      t.integer :shipping_day, null: false 
      t.integer :shipping_type, null: false 
      t.integer :shipping_fee, null: false 
      t.references :category , null: false, foreign_key: true
      t.integer :trading_status, null: false
      t.integer :user, null: false, foreign_key: true
      t.integer :buyer #, foreign_key: true
      t.timestamp :deal_closed_date

      t.timestamps
    end
  end
end
