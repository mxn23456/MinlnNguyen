class Image < ActiveRecord::Base
	has_attached_file :image, styles: { large: "600x600>",medium: "300x300>", thumb: "150x150#"}
	belongs_to :inv, dependent: :destroy
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
