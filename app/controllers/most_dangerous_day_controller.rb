class MostDangerousDayController < ApplicationController
  def index
    # ain't this just an ugly bag of worms...
    
    asteroids = Asteroid.grab_asteroids(params[:start_date], params[:end_date])
    dangerous_roids = find_all_dangerous_asteroids(asteroids)
    grouped_roids = group_asteroids(dangerous_roids)
    date_with_most_asteroids = day_with_most_dangerous_asteroids(asteroids)
    @date = date_with_most_asteroids.first
    @asteroids = date_with_most_asteroids.last
  end

  def find_all_dangerous_asteroids(roids)
    roids.find_all do |roid|
      roid.potentially_hazardous == true
    end
  end

  def group_asteroids(asteroids)
    asteroids.group_by do |asteroid|
      asteroid.date
    end
  end

  def day_with_most_dangerous_asteroids(asteroids)
    asteroids.max_by do |key, value|
      value.count
    end
  end
end
