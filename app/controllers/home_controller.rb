class HomeController < ApplicationController
  def index
    @fonts = Font.all
  end
end
