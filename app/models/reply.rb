class Reply < ActiveRecord::Base
    belongs_to :user, :foreign_key => :created_user
    belongs_to :item, :foreign_key => :item_id
end
