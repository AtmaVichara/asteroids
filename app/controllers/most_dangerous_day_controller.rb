class MostDangerousDayController < ApplicationController
  def index
    @asteroids = Asteroid.grab_asteroids(params[:start_date], params[:end_date])
  end
end
