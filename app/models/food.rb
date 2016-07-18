class Food < ApplicationRecord
	mount_uploader :image_file, ImageFileUploader
end
