class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :message
      t.integer :created_user
      t.integer :updated_user
      t.integer :item_id

      t.timestamps
    end
  end
end
