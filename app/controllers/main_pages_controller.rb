class MainPagesController < ApplicationController
  def home
    @sports = Sport.all
  end
end
