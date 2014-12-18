class AddPostGenre < ActiveRecord::Migration
  def change
  	add_column :post_lists, :genre, :string
  end
end
