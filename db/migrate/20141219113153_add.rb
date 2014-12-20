class Add < ActiveRecord::Migration
  def change
    add_column :items, :created_user, :string
    add_column :items, :updated_user, :string
  end
end
