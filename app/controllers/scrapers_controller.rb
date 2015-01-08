require 'scraper'

class ScrapersController < ApplicationController

  def create
    scraper = Scraper.new
    parsed_website = scraper.get_webpage(params[:url])
    
    if parsed_website == "invalid_url"
      @results = -1
    elsif parsed_website == "blank_url"
      @results = -2
    else
      @results = scraper.scrape      
      
    end
    render json: @results
    
  end

end
