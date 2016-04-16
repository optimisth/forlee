class About < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
