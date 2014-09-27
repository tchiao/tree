class Entry < ActiveRecord::Base
	has_many :categorizings
	has_many :categories, through: :categorizings

	def category_list
		categories.join(", ")
	end

	def category_list=(categories_string)
		category_names = categories_string.split(",").collect {|s| s.strip}.uniq
		new_or_found_categories = category_names.collect {|name| Category.find_or_create_by(name: name) }
		self.categories = new_or_found_categories
	end
end
