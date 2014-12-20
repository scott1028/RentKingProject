class Add < ActiveRecord::Migration
  def change
    add_column :items, :created_user, :integer
    add_column :items, :updated_user, :integer
  end
end
