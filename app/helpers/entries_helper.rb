module EntriesHelper
	
	def entry_params
		params.require(:entry).permit(:title, :date, :location, :body, :category_list)
	end
end
