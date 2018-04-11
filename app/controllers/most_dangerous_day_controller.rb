class MostDangerousDayController < ApplicationController
  def index
    asteroids = Asteroid.grab_asteroids(params[:start_date], params[:end_date])
    dangerous_roids = find_all_dangerous_asteroids(asteroids)
    binding.pry

  end

  def find_all_dangerous_asteroids(roids)
    roids.find_all do |roid|
      roid.potentially_hazardous == true
    end
  end

  def group_asteroids
    
  end

  def day_with_most_dangerous_asteroids
end
