# 10.times do 
# 	Service.create({
# 		title: Faker::Book.title,
# 		detail: Faker::Lorem.sentence,
# 		price: rand(100..1000),
# 		category_id: rand(1..Category.count)
# 	})
# end


role1 = Role.new
role1.name = "admin"
role1.save

role2 = Role.new
role2.name = "user"
role2.save