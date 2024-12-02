class ScreeningsController < ApplicationController
  def index
    @screenings = Screening.all
  end
end