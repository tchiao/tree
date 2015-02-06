require 'scraper'

class ScrapersController < ApplicationController

  def create

    @scraper = Scraper.new
    @parsed_website = @scraper.get_webpage(params[:url])
    if @parsed_website == "invalid_url"
      @results = "invalid_url"
    elsif @parsed_website == "blank_url"
      @results = "blank_url"
    else
      @results = @scraper.scrape 
    end
    render json: @results.to_json
  end

end
