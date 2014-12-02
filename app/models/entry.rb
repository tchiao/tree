class Entry < ActiveRecord::Base
	has_many :categorizings
	has_many :categories, through: :categorizings
	default_scope { order('date') }
	validates_presence_of :title, :date, :location, :body
	after_destroy :remove_empty_categories

	def remove_empty_categories
		categories.each do |category|
			category.destroy if category.entries.empty?
		end
	end

	def category_list
		categories.join(", ")
	end

	def category_list=(categories_string)
		category_names = categories_string.split(",").collect {|s| s.strip}.uniq
		new_or_found_categories = category_names.collect {|name| Category.find_or_create_by(name: name) }
		self.categories = new_or_found_categories
	end

	def self.search(search)
		if search
			where('title LIKE ?', "%#{search}")
		else
			Entry.all
		end
	end
end
