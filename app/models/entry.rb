class Entry < ActiveRecord::Base
	has_many :categorizings
	has_many :categories, through: :categorizings
	default_scope { order('date') }
	validates_presence_of :title, :date, :location, :body
	validates_uniqueness_of :title
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

	def self.keyword_search(search)
		if search
			where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%") | joins(:categories).where('categories.name LIKE ?', "%#{search}%")
		else
			Entry.all
		end
	end

	def self.date_search(start_date, end_date)
		if start_date && end_date
			date1 = Date.new start_date["(1i)"].to_i, start_date["(2i)"].to_i, start_date["(3i)"].to_i
			date2 = Date.new end_date["(1i)"].to_i, end_date["(2i)"].to_i, end_date["(3i)"].to_i
			where('date BETWEEN ? AND ?', "#{date1}", "#{date2}")
		else
			Entry.all
		end
	end

end
