class Entry < ActiveRecord::Base
	has_many :categorizings
	has_many :categories, through: :categorizings
	default_scope { order('date') }
	validates_presence_of :title, :date, :location, :body
	validates_uniqueness_of :title
	after_destroy :remove_empty_categories
	belongs_to :user

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
			where('LOWER(title) LIKE ? OR LOWER(body) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%") | joins(:categories).where('LOWER(categories.name) LIKE ?', "%#{search.downcase}%")
		else
			Entry.all
		end
	end
 
	def self.date_search(start_date, end_date)
		
		# Default dates if any field left blank
		start_month = 1
		start_day = 1
		if Entry.count != 0
			start_year = Entry.first.date.year
			end_year = Entry.last.date.year
		else
			start_year = 1000
			end_year = Date.today.year
		end
		end_month = 12
		end_day = 31

		# Prevent search completing until year filled out
		if start_date && end_date
			if start_date["(1i)"].length == 4
				start_year = start_date["(1i)"].to_i
				if start_date["(2i)"] != ""
					start_month = start_date["(2i)"].to_i
				end
				if start_date["(3i)"] != ""
					start_day = start_date["(3i)"].to_i
				end
			end

			if end_date["(1i)"].length == 4
				end_year = end_date["(1i)"].to_i
				if end_date["(2i)"] != ""
					end_month = end_date["(2i)"].to_i
				end
				if end_date["(3i)"] != ""
					end_day = end_date["(3i)"].to_i
				end
			end
		end

		date1 = Date.new start_year, start_month, start_day rescue nil
		date2 = Date.new end_year, end_month, end_day rescue nil

		where('date BETWEEN ? AND ?', "#{date1}", "#{date2}")
	end

end
