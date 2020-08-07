class Service < ApplicationRecord
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_many :cart_items
	belongs_to :category
end
