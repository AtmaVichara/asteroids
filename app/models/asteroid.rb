class Asteroid

  attr_reader :potentially_hazardous, :neo_reference_id, :date, :name

  def initialize(data = {})
    @neo_reference_id = data[:neo_reference_id]
    @name = data[:name]
    @potentially_hazardous = data[:is_potentially_hazardous_asteroid]
    @date = data[:close_approach_data].first[:close_approach_date]
  end


  def self.grab_asteroids(start_date, end_date)
    data = NasaSearchService.asteroid_feed(start_date, end_date)[:near_earth_objects]
    data.map do |key, value|
      value.map do |asteroid|
        new(asteroid)
      end
    end.flatten
  end

end
