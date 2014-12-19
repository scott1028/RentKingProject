class Add < ActiveRecord::Migration
  def change
    add_column :post_lists, :created_user, :string
    add_column :post_lists, :updated_user, :string
  end
end
