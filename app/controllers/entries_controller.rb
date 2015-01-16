class EntriesController < ApplicationController
	respond_to :html, :js, :json

	def index
		if params[:keyword_search]
			@entries = Entry.keyword_search(params[:keyword_search])
		else
			@entries = Entry.date_search(params[:start_date], params[:end_date])
		end

		if @entries == []
			@error_entry = Entry.create!(
  			title: "Sorry, that search didn't turn up any events!",
  			date: Date.today,
  			location: "limbo",
  			body: "Try again with another keyword or date range."
			)
			@entries = [@error_entry]
		end

		@entry = Entry.new
		respond_to do |format|
      format.html
      format.json { render :index }
    end
		if @error_entry != nil
			@error_entry.destroy
		end
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def create
		#@categories_params = params[:entry].delete(:category_list)
		@entry = Entry.new(entry_params)
		if @entry.save
			#@entry.update_attributes(category_list: @categories_params)
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
			redirect_to entries_path
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
		params.require(:entry).permit(:title, :date, :location, :body, :category_list, :url)
	end

end