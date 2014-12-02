class EntriesController < ApplicationController
	before_filter :disable_nav, only: [:new, :edit]
	respond_to :html, :js

	def index
		@entries = Entry.search(params[:search])
		
		@entry = Entry.new
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params)

		if @entry.save
			@entries = Entry.all
			flash[:notice] = "'#{@entry.title}' created!"
		end
		
		respond_with(@entry) do |format|
			format.html { redirect_to entries_path }
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		if @entry.destroy
			@entries = Entry.all
			flash[:notice] = "'#{@entry.title}' deleted"
			redirect_to entries_path
		else
			flash[:error] = "Sorry, there was a problem deleting the event."
			render :show
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])

		if @entry.update(entry_params)
			@entries = Entry.all
			flash[:notice] = "'#{@entry.title}' updated!"
		end

		respond_with(@entry) do |format|
			format.html { redirect_to entries_path }
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:title, :date, :location, :body, :category_list)
	end

end
