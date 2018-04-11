class MostDangerousDayController < ApplicationController
  def index
    # ain't this just an ugly bag of worms...
    @info = MostDangerousDayPresenter.new(params[:start_date], params[:end_date])
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
