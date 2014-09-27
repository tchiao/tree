class Category < ActiveRecord::Base
	has_many :categorizings
	has_many :entries, through: :categorizings

	def to_s
		name
	end

	def to_param
		name
	end

end
