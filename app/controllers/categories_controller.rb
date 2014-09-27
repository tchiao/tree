class CategoriesController < ApplicationController
	before_filter :disable_nav, only: [:index]

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find_by_name(params[:name])
	end

	def destroy
		@category = Category.find_by_name(params[:name])
		@category.destroy
		redirect_to categories_path
	end


end
