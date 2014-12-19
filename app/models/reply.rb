class Reply < ActiveRecord::Base
    belongs_to :user, :foreign_key => :item_id
end
