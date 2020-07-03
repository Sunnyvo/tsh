class PagesController < ApplicationController
  layout "page"
  def index
    @numerology = Numerology.new
  end
end

