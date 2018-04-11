class Asteroid

  def initialize(data = {})
    @neo_reference_id = data[:neo_reference_id]
    @name = data[:name]
    @potentially_hazardous = data[:is_potentially_hazardous_asteroid]
    @date = data[:close_approach_data].first[:close_approach_date]
  end


  def self.grab_asteroids(start_date, end_date)
    data = NasaSearchService.new(start_date, end_date).asteroid_feed

  end
end
