class CreatePostLists < ActiveRecord::Migration
  def change
    create_table :post_lists do |t|
      t.string :label
      t.text :description
      t.integer :price
      t.string :photo

      t.timestamps
    end
  end
end
