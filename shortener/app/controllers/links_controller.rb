class LinksController < ApplicationController

  def search
    shortlink = params[:shortlink]
    link = Link.search_by_short(shortlink)
    redirect_to("#{link.original_url}")
  end

  def index
  end

  def create
    url = params[:url]
    check = Link.find_by(original_url: url)
    if check != nil
      check.visits += 1
      check.save
      redirect_to("/show/#{check.id}")  
    else
      shortlink = Link.random_string(3)
      link = Link.new(
        :short_url => shortlink,
        :original_url => url,
        :visits => 1)
      link.save
      redirect_to("/show/#{link.id}")  
    end
  end

  def show
    id = params[:id]
    @link = Link.find_by(id: id)
  end

  def visited
    @links = Link.all
  end
end
