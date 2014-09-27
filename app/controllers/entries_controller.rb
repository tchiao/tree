class EntriesController < ApplicationController
	include EntriesHelper
	before_filter :disable_nav, only: [:new, :edit]
	
	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(entry_params)
		@entry.date = Date.strptime(entry_params[:date], "%m/%d/%Y")
		#@entry.date = @entry.date.strftime("%m/%d/%Y")
		#@entry.date = Date.strptime(entry_params[:date], "%m/%d/%Y").strftime("%m/%d/%Y")
		@entry.save
		flash.notice = "'#{@entry.title}' created!"
		redirect_to entry_path(@entry)
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		flash.notice = "'#{@entry.title}' deleted"
		redirect_to entries_path
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
		#@entry.date = Date.strptime(entry_params[:date], "%m/%d/%Y")
		#Date.strptime(@entry.date, "%m/%d/%Y").strftime("%m/%d/%Y")

		#Date.strptime(entry_params[:date], "%m/%d/%Y").strftime("%m/%d/%Y")

		@entry.update(entry_params)
		flash.notice = "'#{@entry.title}' updated!"
		redirect_to entry_path(@entry)
	end


end
