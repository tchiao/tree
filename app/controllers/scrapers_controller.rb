require 'scraper'

class ScrapersController < ApplicationController

  def create
    scraper = Scraper.new(params[:url])
    @results = scraper.scrape

    #render "create.html.erb", layout: false
    render json: @results
  end

end
