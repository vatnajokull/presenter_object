class Image < ApplicationRecord
  belongs_to :author
  mount_uploader :file, ImageUploader
end
