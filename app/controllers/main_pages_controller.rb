class MainPagesController < ApplicationController
  def home
    @sports = Sport.all
  end

  def search
  end
end
