class CreatePostLists < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :label
      t.text :description
      t.integer :price
      t.string :photo

      t.timestamps
    end
  end
end
