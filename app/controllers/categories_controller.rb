class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find_by_name(params[:name])
		@entries = @category.entries
	end

	def destroy
		@category = Category.find_by_name(params[:name])
		@category.destroy
		redirect_to categories_path
	end

end
