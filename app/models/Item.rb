class Item < ActiveRecord::Base
	mount_uploader :photo, AvatarUploader
    belongs_to :user, :foreign_key => :created_user
end
