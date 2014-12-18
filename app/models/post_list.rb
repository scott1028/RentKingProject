class PostList < ActiveRecord::Base
	mount_uploader :photo, AvatarUploader
end
