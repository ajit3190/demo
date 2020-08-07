module ApplicationHelper
	def service_dashboard_img(service)
		if service.image.present?
	    image_tag service.image.url
	  else
	    image_tag 'default_service.png'
	  end
	end

	def category_dashboard_img(c)
		if c.image.present?
	    image_tag c.image.url
	  else
	    image_tag 'default_category.png'
	  end
	end

	def cart_item_dashboard_img(ci)
		if ci.service.image.present?
	    	image_tag ci.service.image.url
	  else
	    image_tag 'default_category.png'
	  end
	end
	
	def search_dashboard_img(result)
		if result.image.present?
	    image_tag result.image.url
	  else
	    image_tag 'default_category.png'
	  end
	end
end