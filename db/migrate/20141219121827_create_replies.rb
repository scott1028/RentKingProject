class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :message
      t.string :created_user
      t.string :updated_user
      t.integer :item_id

      t.timestamps
    end
  end
end
