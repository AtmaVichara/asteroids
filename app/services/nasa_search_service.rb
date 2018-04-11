class NasaSearchService

  # def initialize(start_date, end_date)
  #   @start_date = start_date
  #   @end_date = end_date
  # end
  #
  # def stringify_time(time)
  #   Time.parse(time).strftime('%Y-%m-%d')
  # end
  #
  # def asteroid_feed
  #   start_date = stringify_time(@start_date)
  #   end_date = stringify_time(@end_date)
  #   get_url("/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{ENV["NASA_KEY"]}")
  # end

  def self.find_asteroid(id)
    get_url("/neo/rest/v1/neo/#{id}?api_key=#{ENV["NASA_KEY"]}")
  end

  private

    def self.get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new(url: 'https://api.nasa.gov')
    end
end
