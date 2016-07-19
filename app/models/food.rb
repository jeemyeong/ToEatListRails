class Food < ApplicationRecord
	mount_uploader :image, ImageFileUploader
end
