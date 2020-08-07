class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :services
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
