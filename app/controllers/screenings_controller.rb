class ScreeningsController < ApplicationController
  def index
    @screenings = Screening.all
  end

  def new 
    @screening = Screening.new
  end

  def create
    @screening = Screening.new(screening_params)

    if @screening.save
      redirect_to screenings_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  private
  def screening_params
    params.require(:screening).permit(:movie_id, :room_id, :start_time, :weekday)
  end
end