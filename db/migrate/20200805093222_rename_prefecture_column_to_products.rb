class RenamePrefectureColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :prefecture, :prefecture_id
  end
end
