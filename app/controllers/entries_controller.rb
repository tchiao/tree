class EntriesController < ApplicationController
	respond_to :html, :js, :json

	def index
		if params[:keyword_search]
			@entries = Entry.keyword_search(params[:keyword_search])
		else
			@entries = Entry.date_search(params[:start_date], params[:end_date])
		end

		if @entries == []
			Struct.new("Entry", :title, :date, :location, :body, :id)
			@error_entry = Struct::Entry.new("Sorry, that search didn't turn up any events!", Date.today, "limbo", "Try again with another keyword or date range.", -1)
			@entries = [@error_entry]
		end

		@entry = Entry.new
 	end

	def show
		redirect_to entries_path
	end

	def new
		@entry = Entry.new
	end

	def create
		#@categories_params = params[:entry].delete(:category_list)
		@entry = Entry.new(entry_params)
		respond_to do |format|
			if @entry.save
				@entries = Entry.all
				flash[:notice] = "'#{@entry.title}' created!"
				format.html {redirect_to entries_path }
				format.js
			else
				format.html { render :new }
				format.js
			end
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
			redirect_to entries_path
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
		respond_to do |format|
			if @entry.update(entry_params)
				@entries = Entry.all
				flash[:notice] = "'#{@entry.title}' updated!"
				format.html {redirect_to entries_path }
				format.js
			else
				format.html { render :edit }
				format.js
			end
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:title, :date, :location, :body, :category_list, :url)
	end

end