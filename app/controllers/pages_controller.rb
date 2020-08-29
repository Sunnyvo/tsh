class PagesController < ApplicationController
  layout "page"

  def index
    @numerology = Numerology.new
  end

  def readmind
    @numerology = Numerology.new
    render :layout => false
  end
end

