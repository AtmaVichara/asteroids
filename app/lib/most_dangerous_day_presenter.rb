class MostDangerousDayPresenter

  def initialize(start_date, end_date)
    @asteroids = Asteroid.grab_asteroids(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def date
    DateTime.parse(day_with_most_asteroids.first).strftime("%B%e, %Y")
  end

  def asteroids
    day_with_most_dangerous_asteroids.last
  end

  def date_range
    DateTime.parse(@start_date).strftime("%B%e, %Y")
    DateTime.parse(@end_date).strftime("%B%e, %Y")
  end

  def dangerous_asteroids
    @asteroids.find_all do |roid|
      roid.potentially_hazardous == true
    end
  end

  def group_asteroids
    dangerous_asteroids.group_by do |asteroid|
      asteroid.date
    end
  end

  def day_with_most_dangerous_asteroids
    grouped_asteroids.max_by do |key, value|
      value.count
    end
  end

end
